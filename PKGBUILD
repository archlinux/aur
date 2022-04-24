# Maintainer: Fan Chung <thesummernightcat@gmail.com>
pkgname=python-textacy
_pkgname=${pkgname:7}
pkgver=0.12.0
pkgrel=1
pkgdesc="A Python library for performing a variety of natural language processing (NLP) tasks, built on the high-performance spaCy library."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(
    python-cachetools
    python-catalogue
    python-cytoolz
    python-jellyfish
    python-joblib
    python-networkx
    python-numpy
    python-pyphen
    python-requests
    python-scipy
    python-scikit-learn
    python-spacy
    python-tqdm
)
optdepends=('python-matplotlib: for visualization functionality')
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('2c92bdd6b47305447b64e4cb6cc43c11675f021f910a8074bc8149dbf5325e5b')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
