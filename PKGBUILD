# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=tn93
epoch=1
pkgver=1.1.0
pkgrel=1
pkgdesc="TN93 fast distance calculator"
arch=(x86_64)
url="https://github.com/veg/tn93"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'make' 'gcc' 'git')
source=("git+$url.git#tag=v${pkgver}")
md5sums=('81ad8b1c732258b4bda50f4501f7d59e')

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
