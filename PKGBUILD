# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=intelmetool-git
pkgver=0.61.bc96989
pkgrel=1
pkgdesc='Tool for working with Intel Management Engine'
arch=('x86_64')
depends=('pciutils')
url='https://github.com/zamaudio/intelmetool'
license=('GPL2')
source=("${pkgname}::git+${url}#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 intelmetool "${pkgdir}"/usr/bin/intelmetool
}
