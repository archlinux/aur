pkgname=peer-to-peer
pkgver=0.1
pkgrel=1
pkgdesc="Quick file transfer CLI tool using direct connection peer-to-peer"
arch=('x86_64')
url="https://github.com/zelttrox/peer-to-peer"
license=('MIT')
depends=()
makedepends=('go')
source=("$url/archive/refs/tags/Release.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/peer-to-peer-Release"
    go build -o peer .
    mkdir ~/.config/peer
    cp -r config/. ~/.config/peer/
}

package() {
    cd "$srcdir/peer-to-peer-Release"
    install -Dm755 peer "$pkgdir/usr/bin/peer"
}
