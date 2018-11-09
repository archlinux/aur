# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=fselect
pkgver=0.5.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/jhspetersson/fselect"
license=("MIT")

pkgdesc='Find files with SQL-like queries'

source=("$pkgver.tar.gz::https://github.com/jhspetersson/$pkgname/archive/$pkgver.tar.gz")
md5sums=('0134c8d821cfc33e3a5bc94cf9cdff8a')
sha256sums=('0bc9cf437ef4bdb7ff8abb18cae5b8e8489aa3ab66f5312acd9593a30361e6d5')
makedepends=('rust')
depends=('gcc-libs')
conflicts=('fselect-git')
provides=('fselect')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    install -Dm755 "$pkgname-$pkgver/target/release/fselect" "$pkgdir/usr/bin/fselect"
    install -Dm644 "$pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
