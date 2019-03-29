# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-thinc
_origpkgname=thinc
pkgver=7.0.3
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
	"python-dill"
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
	"python-srsly"
)
makedepends=("python-setuptools")
optdepends=("python-spacy: examples")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/thinc/archive/v$pkgver.tar.gz")
md5sums=('99a8b9269046eca5537bed5effde4fbd')

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
