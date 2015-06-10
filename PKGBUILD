# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=physlock-git
pkgver=0.67.v0.4.4.7.g568a46e
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
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX=${pkgdir}/usr install
}
