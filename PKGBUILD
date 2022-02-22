# Maintainer: Gyara <laxect39@gmail.com>

pkgname=mdzk
pkgver=0.5.1
pkgrel=1
pkgdesc="Plain text Zettelkasten based on mdBook"
url="https://github.com/mdzk-rs/$pkgname"
arch=("x86_64")
license=("MPL2")
makedepends=("cargo")
source=(https://github.com/mdzk-rs/${pkgname}/archive/${pkgver//_/-}.tar.gz)
b2sums=('6655ff4f0d65a7bd8f250b0b752a3cb74edfc27ed49dfd77317fba1007c9862ab285b6388b86b065c011a8913336fc0cd29c88b711b650a7ffcc6b33cfa9ef68')

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
