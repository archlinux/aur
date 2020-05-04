# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-thinc
_origpkgname=thinc
pkgver=7.4.0.dev2
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
	"python-mock"
	"python-pathlib"
	"python-catalogue"
	"python-tqdm"
	"python-hypothesis"
	"python-blis"
	"python-six"
	"python-tqdm"
	"python-srsly"
	"python-wasabi"
	"python-pydantic"
)
makedepends=("python-setuptools" "python-wheel" "cython")
optdepends=("python-spacy: examples" "flake8: linting for Python code" "python-pytest-cov: run included tests" 
            "mypy: run included tests" "python-ipykernel: run included tests" )
checkdepends=("python-pytest-cov" "flake8" "mypy")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/thinc/archive/v$pkgver.tar.gz")
md5sums=('0a62680b89d478955eeb6fac875e71e8')


package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1 
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}


