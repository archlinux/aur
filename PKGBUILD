# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-spacy
_origpkgname=spaCy
pkgver=2.0.18
pkgrel=1
pkgdesc="A free open-source library for Natural Language Processing in Python"
arch=("x86_64")
url="https://spacy.io/"
license=("MIT")
depends=("cython"
        "python-numpy"
        "python-msgpack-numpy-git"
        "python-cymem"
        "python-preshed"
        "python-thinc"
        "python-murmurhash"
        "python-plac"
        "python-ujson"
        "python-dill"
        "python-regex"
        "python-requests"
        "python-pytest"
        "python-mock"
        "python-pathlib"
)
makedepends=("python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/spaCy/archive/v$pkgver.tar.gz")
md5sums=("851ae13d5056d00bbf6707a3fdd2b835")

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
