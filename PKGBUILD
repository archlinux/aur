# Maintainer: Maxim Baz <$pkgbuild at maximbaz dot com>

pkgname=kak-lsp
pkgver=5.7.0
pkgrel=1
pkgdesc='Kakoune Language Server Protocol Client'
arch=('x86_64')
url='https://github.com/ul/kak-lsp'
license=('custom:unlicense')
depends=('kakoune')
makedepends=('rust')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/ul/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a0016f386a968f9a4c7d2f08218881cd54e5df9d3716573f552663faa5cdb54a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" target/release/$pkgname
    install -Dm644 -t "$pkgdir/usr/share/$pkgname/examples/" $pkgname.toml
    install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
