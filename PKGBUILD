# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Tiago Santos <ircalf at gmail dot com>

pkgname=libjwt
pkgver=1.11.0
pkgrel=1
pkgdesc="JWT C Library"
arch=('i686' 'x86_64')
url="https://github.com/benmcollins/libjwt"
license=('LGPL3')
depends=('check' 'jansson' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/benmcollins/libjwt/archive/v${pkgver}.tar.gz")
sha256sums=('61acfce6a514369c76ee1f2ffad74519ae91d5830fde478a253f69dcddb7b0af')

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
