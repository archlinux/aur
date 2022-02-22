# Maintainer: Gyara <laxect39@gmail.com>

pkgname=mdzk
pkgver=0.5.2
pkgrel=1
pkgdesc="Plain text Zettelkasten based on mdBook"
url="https://github.com/mdzk-rs/$pkgname"
arch=("x86_64")
license=("MPL2")
makedepends=("cargo")
source=(https://github.com/mdzk-rs/${pkgname}/archive/${pkgver//_/-}.tar.gz)
b2sums=('ce13acf27921166350193f6cff00e78d9821cf0dfd78461fdceae7edede833d65e8f2a9f7ac9a113861139aeeb73276c5e8ca11822491871e3f54ca0c3de13a9')

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
