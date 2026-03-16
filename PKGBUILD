# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>

pkgname=link-lang-git
pkgver=0.4.r0
pkgrel=4
pkgdesc="Link programming language compiler (latest git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/Pilot0253/link-lang"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'gcc' 'raylib')
source=("git+https://github.com/Pilot0253/link-lang.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/link-lang"
    echo "0.4.r$(git rev-list --count HEAD)"
}

build() {
    cd "$srcdir/link-lang"
    g++ -std=c++17 -o link-lang src/*.cpp -I include -lraylib
}

package() {
    cd "$srcdir/link-lang"
    install -Dm755 link-lang "$pkgdir/usr/bin/link-lang"
}
