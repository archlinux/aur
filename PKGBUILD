# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=physlock-git
pkgver=0.4.5.r3.gb64dccc
pkgrel=1
pkgdesc="lightweight linux console locking tool (Git version)"
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/muennich/physlock'
conflicts=('physlock')
source=("${pkgname}::git+https://github.com/muennich/physlock.git#branch=master")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX=${pkgdir}/usr install
}
