pkgname=python-dendropy
_module='DendroPy'
pkgver=5.1.0
pkgrel=1
pkgdesc="A Python library for phylogenetics and phylogenetic computing: reading, writing, simulation, processing and manipulation of phylogenetic trees (phylogenies) and characters."
url="https://github.com/jeetsukumaran/DendroPy"
depends=('python')
makedepends=('python-setuptools' 'python-pip')
license=('BSD')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f6bf69d80467f40e9efea223ee7caa1ebbc4c817679ebc6988c39f2315ddf40e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
