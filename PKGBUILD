# Maintainer: Samuel Sloniker <sam@kj7rrv.com>

pkgname=python-gptc
url="https://git.kj7rrv.com/kj7rrv/gptc"
pkgver=2.1.0
pkgrel=1
pkgdesc="General-purpose text classifier"
arch=('any')
license=('LGPL3')
source=("https://git.kj7rrv.com/kj7rrv/gptc/archive/v${pkgver}.tar.gz")
sha256sums=('7d351dc822cd66161acc9181d46fe6de428c5d7e1c7acc1b183c79925ac699f0')
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



