pkgname=python-dendropy
_module='DendroPy'
pkgver=5.1.3
pkgrel=1
pkgdesc="A Python library for phylogenetics and phylogenetic computing: reading, writing, simulation, processing and manipulation of phylogenetic trees (phylogenies) and characters."
url="https://github.com/jeetsukumaran/DendroPy"
depends=('python')
makedepends=('python-setuptools' 'python-pip')
license=('BSD')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6470bdb8a7d7d5969c113070b412fa9eecc8b1f7d23928c7ed4aa31fca32d818')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
