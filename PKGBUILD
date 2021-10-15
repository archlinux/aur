# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=fselect
pkgver=0.7.7
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/jhspetersson/fselect"
license=("MIT")

pkgdesc='Find files with SQL-like queries'

source=("$pkgver.tar.gz::https://github.com/jhspetersson/$pkgname/archive/$pkgver.tar.gz")
md5sums=('894c9fe42883dcf50159f6811771a2d9')
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
