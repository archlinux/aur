# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-spacy
_origpkgname=spaCy
pkgver=2.2.4
pkgrel=1
pkgdesc="A free open-source library for Natural Language Processing in Python"
arch=("x86_64")
url="https://spacy.io/"
license=("MIT")
depends=("python-numpy"
        "python-cymem"
        "python-preshed"
        "python-thinc"
        "python-murmurhash"
        "python-plac"
        "python-ujson"
        "python-regex"
        "python-requests"
        "python-pathlib"
        "python-srsly"
        "python-wasabi"
        "python-catalogue"
        "python-plac"
        "python-tqdm"
)
makedepends=("python-wheel" "cython")
optdepends=("python-mock: run included tests" "python-pytest: run included tests" "flake8: linting for Python code" )
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/spaCy/archive/v$pkgver.tar.gz")
md5sums=('0e0986ce7fd3db3b7163095d47514e89')

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
