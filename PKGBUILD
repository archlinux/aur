# Maintainer: Paul <uncladscoreless250@simplelogin.com>
pkgname='okane'
pkgver=2023.3.22
pkgrel=1
pkgdesc="A small tool to organize all your financials in your cli"
arch=('x86_64')
url="https://github.com/Paulanerus/Okane"
license=('GPL3')
makedepends=('premake>=5.0beta1-1')
source=("https://github.com/Paulanerus/Okane/releases/download/${pkgver}/Source.tar.gz")
sha512sums=('2c4707e6ecfc5a180216d2c755151a99e0c053c45364a7099ddb73e880f3dd511f49b7a85dfc1f07728ac2a119da5e14b8acf157220e0d9b3b001b56aae551b3')

build(){
    premake5 gmake2

    make config=release
}

package(){
    cd "bin/Release"

    install -Dm755 "Okane" "$pkgdir/usr/bin/okane"
}
