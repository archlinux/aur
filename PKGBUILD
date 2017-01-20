# Maintainer: archlinux.info:tdy

pkgname=lazygull-engine
pkgver=alpha_0.3
pkgrel=1
pkgdesc="A UCI chess engine based on Gull 3"
arch=(x86_64)
url=https://github.com/basil00/Gull
license=(MIT)
source=(https://github.com/basil00/Gull/archive/LazyGull-${pkgver/_/-}.tar.gz)
sha256sums=(0d3952fde37bfb6000fdfde71f1fce9d6a15e1d8aa691131630802dcd36889bc)

build() {
  cd Gull-LazyGull-${pkgver/_/-}/src
  make -f Makefile.linux build
}

package() {
  cd Gull-LazyGull-${pkgver/_/-}/src
  install -Dm755 LazyGull "$pkgdir"/usr/bin/LazyGull
  sed -n 's/^ .[ ]*//; 3,21p' tbprobe.h > LICENSE
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
