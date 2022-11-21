# Maintainer: Gyara <laxect39@gmail.com>

pkgname=obsidian-export
pkgver=22.11.0
pkgrel=1
pkgdesc="Rust library and CLI to export an Obsidian vault to regular Markdown"
url="https://github.com/zoni/$pkgname"
arch=("x86_64")
license=("MIT")
makedepends=("cargo")
source=(https://github.com/zoni/${pkgname}/archive/v${pkgver}.tar.gz)
b2sums=('d34557de744ae9dbe132dfc7c560336443995827618a6c0615d88549e3f11b6bc9e1f6ae7cc9cf364526c7c6e60b3ee9d1f792056e7cf9eb6ae3d1f7a40286b6')

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
