# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-slider
url="https://llllllllll.github.io/slider/index.html"
pkgver=0.5.3
pkgrel=1
pkgdesc="Utilities for working with osu! files and data."
arch=('any')
license=('LGPL3')
source=(
    "https://github.com/llllllllll/slider/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '806f5b5ba33e6eea57ff8d511e644d250612144822f3ee6ccfbcd8b38787cb25'
)
depends=(
    'python>=3.6'
    'python-click'
    'python-numpy'
    'python-requests'
    'python-scipy'
)
makedepends=('python-setuptools')
checkdepends=('python-pytest')
conflicts=('python-slider-git')

build() {
    cd "$srcdir/slider-${pkgver}"
    python setup.py build
}

check() {
    cd "$srcdir/slider-${pkgver}"
    pytest
}

package() {
    cd "$srcdir/slider-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}


