# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Tiago Santos <ircalf at gmail dot com>

pkgname=libjwt
pkgver=1.15.3
pkgrel=1
pkgdesc="JWT C Library"
arch=('i686' 'x86_64')
url="https://github.com/benmcollins/libjwt"
license=('LGPL3')
depends=('check' 'jansson' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/benmcollins/libjwt/archive/v${pkgver}.tar.gz")
sha256sums=('cb2fd95123689e7d209a3a8c060e02f68341c9a5ded524c0cd881a8cd20d711f')

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
