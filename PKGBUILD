# Maintainer: Gyara <laxect39@gmail.com>

pkgname=obsidian-export
pkgver=22.1.0
pkgrel=1
pkgdesc="Rust library and CLI to export an Obsidian vault to regular Markdown"
url="https://github.com/zoni/$pkgname"
arch=("x86_64")
license=("MIT")
makedepends=("cargo")
source=(https://github.com/zoni/${pkgname}/archive/v${pkgver}.tar.gz)
b2sums=('999a202cf5899147466d606f4a6c74fca133417ec5d3134a2d9a45d4357e8a4355c588e07eabe75ab529aa538a025dd9baf3e1af3b592b6b32b6f624a3ba1fad')

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --release --target-dir=target
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: ts=2 sw=2 et:
