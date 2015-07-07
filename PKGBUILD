# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=iioutils
pkgver=0.2
pkgrel=2
pkgdesc="The Industrial I/O equivalent to pciutils" 
arch=('any')
license=('GPL')
depends=('sysfsutils')
url="http://sourceforge.net/projects/iioutils/"
source=("http://sourceforge.net/projects/iioutils/files/iioutils/iioutils-${pkgver}.tar.gz")
md5sums=('8a88b711d3d6a7fedd75af833c5470cb')

build() {
  cd "${pkgname}"
  ./configure --prefix="/usr" --sbindir="/usr/bin"
  make
}

package() {
  cd "${pkgname}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
