# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Stella <jens300304@gmail.com>

pkgname=python-slider
url="https://github.com/llllllllll/slider"
pkgver=0.8.0
pkgrel=1
pkgdesc="Utilities for working with osu! files and data."
arch=('any')
license=('LGPL3')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('aabe931dca8b99a7dcbe40412a803f4394aa458ee51dab8db52e3f712a9b6bd23d67bcd25113b2eeb088f5724ae7a99c64eb99061b7194e6b310168da9b1e1f5')
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


