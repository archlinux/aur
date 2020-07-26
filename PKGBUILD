# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gsim85
pkgver=0.3
pkgrel=1
pkgdesc="An 8085 simulator. It has a very user friendly GUI. It can be used to test 8085 programs before actualy implementing them on target boards"
arch=('x86_64')
url='http://gsim85.sourceforge.net'
license=('GPL')
depends=('gtk2')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/gsim85/files/gsim85-${pkgver}/gsim85-${pkgver}.tar.gz/download")
sha256sums=('03923fded8c146122bf9a8adc51f1104ec8f6fd6e4ed294fa588b0eea607f41c')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}