# Maintainer: pusi77 <pusineriandrea+gmail+com>

pkgname=python-cipheydists
pkgver=0.3.35
pkgrel=2
pkgdesc="A collection of sample distributions for use in Ciphey's frequency analysis"
arch=("any")
url="https://github.com/Ciphey/CipheyDists"
license=("The Unlicense")
depends=("python")
makedepends=(
    "python-build"
    "python-installer"
    "python-wheel"
    "python-setuptools"
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/cipheydists/cipheydists-$pkgver.tar.gz")
sha256sums=('3436fde3f57df732e1a65fb03a565a564dd9d0c8d130c2e94f8b852e6a199a88')

build() {
    cd "$srcdir/cipheydists-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "cipheydists-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
