# Maintainer: Techmeology <techmeology@techmeology.co.uk>
pkgname=python-pcpp
pkgver=1.21
pkgrel=1
pkgdesc="A C99 preprocessor with partial preprocessing capabilities writen in Python."
arch=(any)
url="https://github.com/ned14/pcpp"
license=(BSD)
depends=(python)
source=(pcpp::git+https://github.com/ned14/pcpp.git#tag=v$pkgver)
sha512sums=(SKIP)

prepare() {
    cd "$srcdir"/pcpp
    git submodule update --init
}

build() {
    cd "$srcdir"/pcpp
    python setup.py build
}

package() {
    cd "$srcdir"/pcpp
    python setup.py install --root="$pkgdir"
    install -Dm644 "$srcdir"/pcpp/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
