# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Tiago Santos <ircalf at gmail dot com>

pkgname=libjwt
pkgver=1.14.0
pkgrel=1
pkgdesc="JWT C Library"
arch=('i686' 'x86_64')
url="https://github.com/benmcollins/libjwt"
license=('LGPL3')
depends=('check' 'jansson' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/benmcollins/libjwt/archive/v${pkgver}.tar.gz")
sha256sums=('df7e753b3a523008d7994396afec0ad4f02e5d5636da54319b07ad2c4eb38cd0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-valgrind --disable-doxygen-doc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
