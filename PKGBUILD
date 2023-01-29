# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Stella <jens300304@gmail.com>

pkgname=python-slider
url="https://github.com/llllllllll/slider"
pkgver=0.7.0
pkgrel=1
pkgdesc="Utilities for working with osu! files and data."
arch=('any')
license=('LGPL3')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('51283dcc240925161d0f0119dfb4e71ba06201aeb2c2b70aad3f88ba8cd63dc39743ed1f02e548a10410c5a852d256c31769960ea462c2682de60a93e196e501')
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


