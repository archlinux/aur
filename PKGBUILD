# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Gyara <laxect39@gmail.com>

pkgname=obsidian-export
pkgver=24.11.0
pkgrel=1
pkgdesc="Rust library and CLI to export an Obsidian vault to regular Markdown"
url="https://github.com/zoni/$pkgname"
arch=("x86_64")
license=("MIT")
makedepends=("cargo")
source=(https://github.com/zoni/${pkgname}/archive/v${pkgver}.tar.gz)
b2sums=('a4ac2ebe9bc4d20808ff3b898963a322ff32c36b2b9406e00310e106d42a53a7d4f7e3fba4e72fc86830d3e44bc01f9f5f5329db24ad82f5854044b4b57b9f08')

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
