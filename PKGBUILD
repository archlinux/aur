# Maintainer: 6543 <6543@obermui.de>
# Contributor: 6543 <6543@obermui.de>
pkgname=nodeinfo
pkgver=1.0.0
pkgrel=0
pkgdesc="return nodeinfo as json based on a given domain"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url="https://codeberg.org/thefederationinfo/nodeinfo-go"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=(
  '9906cdfd5e91deaa62e776e5a1b2ba9154ec35b82f20330122042c4acd3ae23a01b09bdf6da8441af0876f38559e58a31304dba8939f23c9e8829dd454c55ff2'
)

build() {
    cd ./$pkgname-go/cli
    go build -tags extension -o "$pkgname" .
}

package() {
    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./$pkgname-go/cli/$pkgname $pkgdir/usr/bin/$pkgname
}
