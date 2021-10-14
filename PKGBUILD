# Maintainer: Gyara <laxect39@gmail.com>

pkgname=obsidian-export
pkgver=21.9.1
pkgrel=1
pkgdesc="Rust library and CLI to export an Obsidian vault to regular Markdown"
url="https://github.com/zoni/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=(https://github.com/zoni/${pkgname}/archive/v${pkgver}.tar.gz)
b2sums=('d803efe2c264d8cad64500a2ac5b772545bf325c4bbbf9ddde7239613d4de4d344ab0f4bfbb5ad2eac1fcfc7efb54d764be20e9b49cab6e0d5ece53854199f63')

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
