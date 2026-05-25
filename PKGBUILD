# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>

pkgname=link-lang-git
pkgver=0.5.r0
pkgrel=1
pkgdesc="Link programming language interpreter (latest git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/Pilot0253/link-lang"
license=('MIT')

depends=('gcc-libs' 'raylib')
makedepends=('git' 'gcc' 'make')

conflicts=('link-lang' 'link-lang-bin')
provides=('link-lang')

source=("git+https://github.com/Pilot0253/link-lang.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/link-lang"
    echo "0.5.r$(git rev-list --count HEAD)"
}

build() {
    cd "$srcdir/link-lang"
    make -f makefile release
}

package() {
    cd "$srcdir/link-lang"

    install -Dm755 linklang "$pkgdir/usr/bin/linklang"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
