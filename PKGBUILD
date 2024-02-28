# Maintainer: 6543 <6543@obermui.de>
# Contributor: 6543 <6543@obermui.de>
pkgname=nodeinfo
pkgver=0.3.2
pkgrel=0
pkgdesc="return nodeinfo as json based on a given domain"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url="https://codeberg.org/thefederationinfo/nodeinfo-go"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=(
  '03875cc116ed6918387f026bcc60ef6ed1c20b144f60badc937d6b6eaec599a9644997aef160797254b6d06c4820d8d2029e1d3b4eeec52df98022e950016d6b'
)

build() {
    cd ./$pkgname-go/cli
    go build -tags extension -o "$pkgname" .
}

package() {
    mkdir -p $pkgdir/usr/bin
    install -D -m755 ./$pkgname-go/cli/$pkgname $pkgdir/usr/bin/$pkgname
}
