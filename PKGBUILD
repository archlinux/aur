# Maintainer: 6543 <6543@obermui.de>
# Contributor: 6543 <6543@obermui.de>
pkgname=nodeinfo
pkgver=0.3.0
pkgrel=2
pkgdesc="return nodeinfo as json based on a given domain"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url="https://codeberg.org/thefederationinfo/nodeinfo-go"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=(
  '282765c4adb2f722d84429ee7768c1fed67c091f'
)

build() {
    cd ./$pkgname-go/cli
    go build -tags extension -o "$pkgname" .
}

package() {
    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./$pkgname-go/cli/$pkgname $pkgdir/usr/bin/$pkgname
}
