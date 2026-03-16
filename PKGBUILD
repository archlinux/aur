# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>

pkgname=link-lang-git
pkgver=0.4.r0
pkgrel=1
pkgdesc="Link programming language compiler (latest git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/Pilot0253/link-lang"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'gcc')
source=("git+https://github.com/Pilot0253/link-lang.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/link-lang"
    echo "0.4.r$(git rev-list --count HEAD)"
}

build() {
    cd "$srcdir/link-lang"
    ./compile-link.sh
}

package() {
    cd "$srcdir/link-lang"
    install -Dm755 link "$pkgdir/usr/bin/link"
}
