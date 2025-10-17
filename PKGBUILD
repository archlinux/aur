# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

# Usage:
#   LD_PRELOAD=/path/to/boost_bypass.so program

pkgname=cuda-boost-bypass
pkgver=20250808
pkgrel=1
pkgdesc="CUDA perfboost bypass preloadable library"
arch=(any)
url="https://gist.github.com/Ristovski/c81502f850ba095320353ec2094b14cf"
license=('MIT')
makedepends=('gcc')
source=('boost_bypass.c')
sha256sums=('dce3c002c7e3d8eabe501dcf1e7939196e8fae167e6334396eef87f29fc45a5a')

build() {
    cc -shared -ldl boost_bypass.c -o boost_bypass.so
}

package() {
    install -d "$pkgdir/usr/lib/"
    install -Dm644 boost_bypass.so "$pkgdir/usr/lib/"
}
