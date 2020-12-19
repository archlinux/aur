# Maintainer: Petr Šťastný <aur@soptik.tech>
pkgname=desed
pkgver=1.2.0
pkgrel=1
pkgdesc="Debugger for sed, written in rust. Step through code and observe sed inner state."
arch=('x86_64')
url="https://github.com/soptikha2/desed"
license=('GPL3')
depends=()
makedepends=('cargo')
conflicts=('desed-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"

    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/desed" -T "$pkgdir/usr/bin/desed"
    install -Dm644 "desed.1" -T "$pkgdir/usr/share/man/man1/desed.1"
}
