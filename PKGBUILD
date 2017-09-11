# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=libstaroffice
pkgver=0.0.4
pkgrel=1
pkgdesc='filter for old StarOffice documents(.sdc, .sdw, ...) based on librevenge'
url='https://github.com/fosnola/libstaroffice'
arch=('i686' 'x86_64')
license=('MPL')
depends=('librevenge')
makedepends=('doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fosnola/libstaroffice/archive/${pkgver}.tar.gz")
sha256sums=('d604f3e0c1c2dd96a058c7f94eddbf603dc4371f72b9aebeea7e5a8fa3c16b60')

build() {
  cd "${pkgname}-${pkgver}"
  NOCONFIGURE=1 ./autogen.sh 
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
