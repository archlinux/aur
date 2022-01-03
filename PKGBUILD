# Maintainer: Gyara <laxect39@gmail.com>

pkgname=mdzk
pkgver=0.5.0
pkgrel=1
pkgdesc="Plain text Zettelkasten based on mdBook"
url="https://github.com/mdzk-rs/$pkgname"
arch=("x86_64")
license=("MPL2")
makedepends=("cargo")
source=(https://github.com/mdzk-rs/${pkgname}/archive/${pkgver//_/-}.tar.gz)
b2sums=('5a41e153cffe553bd6f42459bd2cc3f31a1fc2a5e8540c99607ac83f5cc8515b9361e876098f0567fc91819a1649bad495cae61ca56290f490b428fa070b1151')

build()
{
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    cargo build --release --target-dir=target
}

package()
{
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: ts=2 sw=2 et:
