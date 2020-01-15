# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-thinc
_origpkgname=thinc
pkgver=7.3.1
pkgrel=1
pkgdesc="Practical Machine Learning for NLP"
arch=("x86_64")
url="https://github.com/explosion/thinc"
license=("MIT")
depends=("cython"
	"python-numpy"
	"python-cymem"
	"python-preshed"
	"python-murmurhash"
	"python-plac"
	"python-ujson"
	"python-pytest"
	"python-mock"
	"python-pathlib"
	"python"
	"python-hypothesis"
	"python-cytoolz"
    "python-toolz"
	"python-blis"
	"python-six"
	"python-tqdm"
	"python-wrapt"
	"python-srsly-git"
	"python-wasabi-git"
)
makedepends=("python-setuptools")
optdepends=("python-spacy: examples")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/thinc/archive/v$pkgver.tar.gz")
md5sums=('b1c28b66928e63f2c8aeb8d8070f02f6')

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
