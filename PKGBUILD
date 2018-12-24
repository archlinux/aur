# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-unitify
pkgver=1.0.1
pkgrel=1
pkgdesc='Replaces all nouns in a text with the word "unit"'
url="https://github.com/flipflop97/unitify"
depends=(python-spacy
         python-spacy-en_core_web_sm)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/32/76/4498ccc4a9394521a13f56e0316d2a3b1b4d57d07221c4a9401199a71975/unitify-${pkgver}.tar.gz")
sha256sums=("8ee15d4e4b0cb2351d2ace202477dc791bfca283e144e6e2729e2e01c383ac1a")

build(){
    cd "unitify-${pkgver}"
    python setup.py build
}

package(){
    cd "unitify-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
