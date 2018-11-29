# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=fselect
pkgver=0.5.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/jhspetersson/fselect"
license=("MIT")

pkgdesc='Find files with SQL-like queries'

source=("$pkgver.tar.gz::https://github.com/jhspetersson/$pkgname/archive/$pkgver.tar.gz")
md5sums=('09b239e0669c80535b1cb7d9c3a76f22')
sha256sums=('28af31ce16800d11666c0c6a1d177ab5115339fcaf6c6801b1583be1c19fae5a')
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
