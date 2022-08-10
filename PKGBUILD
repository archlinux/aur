# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Stella <jens300304@gmail.com>

pkgname=python-slider
url="https://github.com/llllllllll/slider"
pkgver=0.6.0
pkgrel=2
pkgdesc="Utilities for working with osu! files and data."
arch=('any')
license=('LGPL3')
source=("https://github.com/llllllllll/slider/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d9745655ec938a0639fd4bd755a12dc0112b5f0eb94f0d47c970cf2d676cf22')
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


