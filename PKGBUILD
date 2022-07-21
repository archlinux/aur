# Maintainer: Samuel Sloniker <sam@kj7rrv.com>

pkgname=python-gptc
url="https://git.kj7rrv.com/kj7rrv/gptc"
pkgver=2.1.2
pkgrel=1
pkgdesc="General-purpose text classifier"
arch=('any')
license=('LGPL3')
source=("https://git.kj7rrv.com/kj7rrv/gptc/archive/v${pkgver}.tar.gz")
sha256sums=('13c373b97f49ae7dbf6cbc7a856c7704ec7261e86cbe0c3d019c63502c7a3749')
depends=(
    'python>=3.7'
    'python-emoji'
)
makedepends=(
    'python-setuptools'
    'python-build'
    'python-installer'
    'python-wheel'
)

build() {
    cd "$srcdir/gptc"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/gptc"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
