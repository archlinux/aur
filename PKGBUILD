# Maintainer: Prasanth Baskar <bupdprasanth@gmail.com>
pkgname=kitops
pkgver=1.7.0
pkgrel=1
pkgdesc="KitOps CLI tool"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/kitops-ml/kitops"
license=('Apache')
# depends=()
provides=('kit')
conflicts=('kit')
source_x86_64=("https://github.com/kitops-ml/kitops/releases/download/v${pkgver}/kitops-linux-x86_64.tar.gz")
source_i686=("https://github.com/kitops-ml/kitops/releases/download/v${pkgver}/kitops-linux-i386.tar.gz")
source_aarch64=("https://github.com/kitops-ml/kitops/releases/download/v${pkgver}/kitops-linux-arm64.tar.gz")
sha256sums_x86_64=('2d43dc391ae850bbc15e423782d05019aea3659a611e42786f8c2a7df1820b06')
sha256sums_i686=('764dedfb5371c0b07203daec7746125f362d98312514caf2702bc4177b9bc3a2')
sha256sums_aarch64=('24dec23203c3735cadd1598e579bb25d456a833695ee41b10203f05de6a3d51b')

package() {
  cd "$srcdir"

  # Extract based on arch
  case "$CARCH" in
    x86_64)  tar -xzf kitops-linux-x86_64.tar.gz ;;
    i686)    tar -xzf kitops-linux-i386.tar.gz ;;
    aarch64) tar -xzf kitops-linux-arm64.tar.gz ;;
  esac

  # Install binary
  install -Dm755 kit "$pkgdir/usr/bin/kit"
}
