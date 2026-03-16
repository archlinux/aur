# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>

pkgname=link-lang
pkgver=0.4
pkgrel=2
pkgdesc="Link programming language compiler"
arch=('x86_64' 'aarch64')
url="https://github.com/Pilot0253/link-lang"
license=('MIT')
depends=('gcc-libs')
makedepends=('gcc')
source=("https://github.com/Pilot0253/link-lang/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('347119138e0b75975892a70fe7a38b12bb310cc733900f3238df9f3a49b1da16')

build() {
    cd "$srcdir/link-lang-$pkgver"
    g++ -std=c++17 -o link src/*.cpp -I include
}

package() {
    cd "$srcdir/link-lang-$pkgver"
    install -Dm755 link "$pkgdir/usr/bin/link"
}
