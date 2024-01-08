# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=tn93
pkgver=.1.0.13.actual
pkgrel=1
pkgdesc="TN93 fast distance calculator"
arch=(x86_64)
url="https://github.com/veg/tn93"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'make' 'gcc' 'git')
source=("git+$url.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd $pkgname
  mkdir -p build && cd build
  cmake ..
  make
}

package() {
  cd $pkgname/build 
  chmod +x $pkgname
  install -Dm 755 $pkgname ${pkgdir}/usr/bin/$pkgname
}
