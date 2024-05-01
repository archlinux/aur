# Maintainer: 1ridic <i at 8f dot al>
pkgname=easylpac
pkgver=0.7.5
pkgrel=1
pkgdesc="lpac GUI Frontend"
arch=('x86_64')
url="https://github.com/creamlike1024/EasyLPAC"
license=('MIT')
makedepends=('go')
depends=('lpac')
provides=("easylpac")
conflicts=("easylpac")
source=(
  easylpac-$pkgver.tar.gz::https://github.com/creamlike1024/EasyLPAC/archive/refs/tags/$pkgver.tar.gz
)
sha256sums=(
  "SKIP"
)

build() {
  cd $srcdir/EasyLPAC-$pkgver
  go generate
  go build -ldflags="-s -w"
}

package() {
  # Install the executables
  install -d "$pkgdir"/usr/bin/
  install -m 755 $srcdir/EasyLPAC-$pkgver/EasyLPAC "$pkgdir"/usr/bin/
}
