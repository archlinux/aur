# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Manuel Hüsers <manuel dot huesers at uni-ol dot de>
# Contributor: fstirlitz <felix dot von dot s at posteo dot de>

pkgname=libxmlbird
pkgver=1.2.11
pkgrel=1
pkgdesc='XML parsing library written in Vala'
arch=('i686' 'x86_64')
url='https://birdfont.org/xmlbird.php'
license=('LGPL3')
depends=('glib2')
makedepends=('vala' 'python')
source=(https://birdfont.org/xmlbird-releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('da06d6368b9f0cc91e24810ac687c3ff2c892e069821b04db8632606d5911c8c9d33fa91cf8b7974f3dce605a0ec9be85c49104bd44fdfb4ff89a5d5acef31b7'
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
