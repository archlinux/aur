# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=vmware-component-extractor-git
pkgver=0.2.b3b995a
pkgrel=1
pkgdesc="Extract VMware Tools ISO from component file"
arch=('i686' 'x86_64')
license=('custom')
url='https://github.com/17twenty/VMWare-Component-Extractor'
depends=()
source=("${pkgname}::git+https://github.com/17twenty/VMWare-Component-Extractor#branch=master")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}"/usr/bin/
  install -m755 VMWareComponentExtractor "${pkgdir}"/usr/bin/
}
