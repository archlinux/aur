pkgname=hyclock
pkgver=0.1.0
pkgrel=1
pkgdesc="Une horloge ASCII pour le terminal écrite en Python"
arch=('any')
url="https://github.com/lfotkrc/hyclock"
license=('MIT')

depends=(
    'python'
    'python-rich'
    'python-pyfiglet'
    'python-colorama'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)

source=(
    "https://github.com/lfotkrc/hyclock/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
    'SKIP'
)


build() {
    cd "$srcdir/$pkgname-$pkgver"

    python -m build --wheel --no-isolation
}


package() {
    cd "$srcdir/$pkgname-$pkgver"

    python -m installer \
        --destdir="$pkgdir" \
        dist/*.whl
}