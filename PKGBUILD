# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Manuel Hüsers <manuel dot huesers at uni-ol dot de>
# Contributor: fstirlitz <felix dot von dot s at posteo dot de>

pkgname=libxmlbird
pkgver=1.2.10
pkgrel=1
pkgdesc='XML parsing library written in Vala'
arch=('i686' 'x86_64')
url='https://birdfont.org/xmlbird.php'
license=('LGPL3')
depends=('glib2')
makedepends=('vala' 'python')
source=(https://birdfont.org/xmlbird-releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('f265d9899a3f88fde21bdee63877441e2b7bc7f94c6c04cb6ea8b24fc1c03b37023ffec6a43d93ea447720fe3268890b5ca5b53fc72030bf54ad440654f4e0c0'
            'SKIP')
validpgpkeys=('FB3BEFA59A6FF7F0E0682B68BCD31D4CCCEB9DD4') # Johan Mattsson <gmail: johan dot mattsson dot m>

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure -p /usr -l /lib --cflags "$CFLAGS" --ldflags "$LDFLAGS"
  ./build.py
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./install.py -d "${pkgdir}"
}
