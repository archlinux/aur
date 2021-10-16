# Maintainer: Gyara <laxect39@gmail.com>

pkgname=mdzk
pkgver=0.4.3_rc1
pkgrel=3
pkgdesc="Plain text Zettelkasten based on mdBook"
url="https://github.com/mdzk-rs/$pkgname"
arch=("x86_64")
license=("MPL2")
makedepends=("cargo")
source=(https://github.com/mdzk-rs/${pkgname}/archive/${pkgver//_/-}.tar.gz)
b2sums=('4c2c374bbabe2203f9c185128fea8d0b0d1cd82ec7f3b93085b1b458c3f2c733b53b6a48f55cbfbc37eee50c0e766e693c70f83b7df2ee10ac0b591eedf6b960')

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
