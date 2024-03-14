# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Gyara <laxect39@gmail.com>

pkgname=obsidian-export
pkgver=23.12.0
pkgrel=1
pkgdesc="Rust library and CLI to export an Obsidian vault to regular Markdown"
url="https://github.com/zoni/$pkgname"
arch=("x86_64")
license=("MIT")
makedepends=("cargo")
source=(https://github.com/zoni/${pkgname}/archive/v${pkgver}.tar.gz)
b2sums=('6f5f80ccac1243f46b7c929883850261f141ff2518735c269cfc13497537726202efef51f254a87b85e017ac5a1575dc8d6f68d130091a4bcb5ea8dc50f16105')

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
