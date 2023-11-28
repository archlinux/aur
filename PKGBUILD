# Maintainer: 6543 <6543@obermui.de>
# Contributor: 6543 <6543@obermui.de>
pkgname=nodeinfo
pkgver=0.3.0
pkgrel=0
pkgdesc="return nodeinfo as json based on a given domain"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url="https://codeberg.org/thefederationinfo/nodeinfo-go"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=(
  '5bb2a5ce3d55fa31738455a238def7945195e17a'
)

build() {
    cd ./$pkgname-go/cli
    go build -o "$pkgname" .
}

package() {
    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./$pkgname-go/cli/$pkgname $pkgdir/usr/bin/$pkgname
}
