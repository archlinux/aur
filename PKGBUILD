pkgname=python-dendropy
_module='DendroPy'
pkgver=5.0.10
pkgrel=1
pkgdesc="A Python library for phylogenetics and phylogenetic computing: reading, writing, simulation, processing and manipulation of phylogenetic trees (phylogenies) and characters."
url="https://github.com/jeetsukumaran/DendroPy"
depends=('python')
makedepends=('python-setuptools' 'python-pip')
license=('BSD')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f36a93d35d6f308bb82efc01dae5e5d56ffe8a7663a81d1a7a937f15ad05aa52')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
