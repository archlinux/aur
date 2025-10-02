# Maintainer: 1dylan1 dylan@whati.me 
pkgname=cmdr
pkgver=1.0.0
pkgrel=1
pkgdesc="An easily configurable command-line tool for accessing Source RCON servers."
arch=('x86_64')
url="https://github.com/1dylan1/cmdr"
license=('MIT')
depends=()
makedepends=('go')
source=("https://github.com/1dylan1/cmdr/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f4ccc65188c408379099da5dbfde4aff115db69028ef645283493fa919ba57d')

build() {
    cd "$srcdir/cmdr-v${pkgver}"
    go build -o cmdr . 
}

package() {
    cd "$srcdir/cmdr-v${pkgver}"
    install -Dm755 cmdr "$pkgdir/usr/bin/cmdr"  
    install -Dm644 config.yaml.example "$pkgdir/etc/cmdr/config.yaml"  
}
