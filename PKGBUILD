# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=boltbrowser
pkgver=2.2
pkgrel=1
pkgdesc="BoltBrowser - lightweight CLI browser for BoltDB"
arch=('x86_64' 'aarch64')
url="https://github.com/br0xen/boltbrowser"
license=('GPL3')
depends=()
makedepends=()

case "$CARCH" in
  x86_64)
    source=("https://github.com/br0xen/boltbrowser/releases/download/${pkgver}/boltbrowser.linux64")
    sha256sums=('7747926b067bbb8bdf3bbc25102ffe98b1ad4fee9d237f61b32f2e0800cd55d9')
    ;;
  aarch64)
    source=("https://github.com/br0xen/boltbrowser/releases/download/${pkgver}/boltbrowser.linuxarm")
    sha256sums=('4be06b2d37c02107469b6538a4e5275762e2afe029bfb08e17b39186e9b032eb')
    ;;
  *)
    echo "Unsupported architecture: $CARCH"
    exit 1
    ;;
esac

package() {
  install -Dm755 "$(basename "${source[0]}")" "$pkgdir/usr/bin/boltbrowser"
}
