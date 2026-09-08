# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=tn93
epoch=1
pkgver=1.0.17
pkgrel=1
pkgdesc="TN93 fast distance calculator"
arch=(x86_64)
url="https://github.com/veg/tn93"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'make' 'gcc' 'git')
source=("git+$url.git#tag=v${pkgver}")
md5sums=('7fda66e648bd7f7c0ec3823c3c781132')

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
