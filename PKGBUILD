# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-slider
url="https://llllllllll.github.io/slider/index.html"
pkgver=0.5.2
pkgrel=1
pkgdesc="Utilities for working with osu! files and data."
arch=('any')
license=('LGPL3')
source=(
    "https://github.com/llllllllll/slider/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '01bedc68480e4b6ff3db459707edd78f48e8ab43dbe05eaf5a934e8fcd3a5c3d'
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


