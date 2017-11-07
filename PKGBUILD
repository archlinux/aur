# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=libstaroffice
pkgver=0.0.5
pkgrel=1
pkgdesc='filter for old StarOffice documents(.sdc, .sdw, ...) based on librevenge'
url='https://github.com/fosnola/libstaroffice'
arch=('i686' 'x86_64')
license=('MPL')
depends=('librevenge')
makedepends=('doxygen')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fosnola/libstaroffice/archive/${pkgver}.tar.gz")
sha256sums=('26a148954f04f92ce648ab0a5e6faba53ded68b22f8d03afe8603d15b6b599d8')

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
