# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-unitify
pkgver=1.0.3
pkgrel=1
pkgdesc='Replaces all nouns in a text with the word "unit"'
url="https://github.com/flipflop97/unitify"
depends=(python-spacy
         python-spacy-en_core_web_sm)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/15/a6/cf8150280774ac1ef10dbbaacf962eb229ce19f57a7b6bb3d7d6c0c450b3/unitify-1.0.3.tar.gz")
sha256sums=('5ac0cc1839d3077514e48b46779519b5e680eabfa54e0a8eafc5e3d0bfb7e045')

build(){
    cd "unitify-${pkgver}"
    python setup.py build
}

package(){
    cd "unitify-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
