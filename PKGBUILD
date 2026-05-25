# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>

pkgname=link-lang
pkgver=0.5
pkgrel=1
pkgdesc="Link programming language interpreter"
arch=('x86_64' 'aarch64')
url="https://github.com/Pilot0253/link-lang"
license=('MIT')

depends=('gcc-libs' 'raylib')
makedepends=('gcc' 'make')

conflicts=('link-lang-git' 'link-lang-bin')

source=("https://github.com/Pilot0253/link-lang/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/link-lang-$pkgver"
    make -f makefile release
}

package() {
    cd "$srcdir/link-lang-$pkgver"

    install -Dm755 linklang "$pkgdir/usr/bin/linklang"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
