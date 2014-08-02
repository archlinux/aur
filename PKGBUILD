# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Thomas td123 Dziedzic <gostrc@gmail.com>
# Contributor: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>
# Contributor: jht <stefano@inventati.org>

pkgname=clips
pkgver=6.30
_pkgver=6.30.0.20090722svn
pkgrel=1
pkgdesc="A forward-chaining rule-based programming language written in C that also provides procedural and object-oriented programming facilities."
arch=('i686' 'x86_64')
url="http://clipsrules.sourceforge.net/"
license=('GPL')
depends=('termcap' 'libxaw' 'xbitmaps')
source=(http://downloads.sourceforge.net/project/clipsmm/clips/${_pkgver}/${pkgname}-${_pkgver}.tar.gz)
md5sums=('ff2e140deb47e3c0141f21fb238e2e61')
sha256sums=('9114c371eb4e5a6bb32d746acb8d22591cba7502af2536a994e58a6349b30b2e')
sha384sums=('fe868fce6b8809d69eda21035aaf415b8ed04e460aab20e42bebaac55e2787634e843e94aa5b52eaa02f89b96601a654')
sha512sums=('df614f9a9611db31cb056160285af9bda88294b75ed378a71bdc395436cb511ddd9460d3aaaf0a54338c0e7c2c025ef53e3aa93701f1980d90010b61891f32d7')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}" install
}
