# Maintainer: Samuel Sloniker <sam@kj7rrv.com>

pkgname=python-gptc
url="https://git.kj7rrv.com/kj7rrv/gptc"
pkgver=2.1.1
pkgrel=1
pkgdesc="General-purpose text classifier"
arch=('any')
license=('LGPL3')
source=("https://git.kj7rrv.com/kj7rrv/gptc/archive/v${pkgver}.tar.gz")
sha256sums=('13ca49cbd7eb72b27f34c83bc503eccc813d4769856f95c149f866815995578e')
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



