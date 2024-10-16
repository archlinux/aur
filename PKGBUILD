# Maintainer: Petr Šťastný <aur@soptik.tech>
pkgname=desed
pkgver=1.2.2
pkgrel=1
pkgdesc="Debugger for sed, written in rust. Step through code and observe sed inner state."
arch=('x86_64')
url="https://github.com/soptikha2/desed"
license=('GPL3')
depends=()
makedepends=('cargo')
conflicts=('desed-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('73c75eaa65cccde5065a947e45daf1da889c054d0f3a3590d376d7090d4f651a')

build() {
    cd "$pkgname-$pkgver"

    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/desed" -T "$pkgdir/usr/bin/desed"
    install -Dm644 "desed.1" -T "$pkgdir/usr/share/man/man1/desed.1"
}
