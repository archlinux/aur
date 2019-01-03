# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Tiago Santos <ircalf@gmail.com>

pkgname=libjwt
pkgver=1.10.1
pkgrel=1
pkgdesc="JWT C Library"
arch=('i686' 'x86_64')
url="https://github.com/benmcollins/libjwt"
license=('LGPL3')
depends=('check' 'jansson' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/benmcollins/libjwt/archive/v${pkgver}.tar.gz")
sha256sums=('d1b6c0e6b2b67e4cc83b040c88bf9faa5b614d2d9a1677b4822536f926a280a3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
