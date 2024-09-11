# Maintainer: Paul <uncladscoreless250@simplelogin.com>
pkgname='okane'
pkgver=2024.9.11
pkgrel=1
pkgdesc="A small tool to organize all your financials in your cli"
arch=('x86_64')
url="https://github.com/Paulanerus/Okane"
license=('GPL3')
makedepends=('premake>=5.0beta2-1')
source=("https://github.com/Paulanerus/Okane/releases/download/${pkgver}/Source.tar.gz")
sha512sums=('cee7f6a3a15f404239413e69f0a58175e9719b192d8da3fb0fe7a39ffb2e09f5cf7bf84d2758375e11247b74e5aed06d662d9a1d442e6e966f43997ac92d8ada')

build(){
    premake5 gmake2

    make config=release
}

package(){
    cd "bin/Release"

    install -Dm755 "Okane" "$pkgdir/usr/bin/okane"
}
