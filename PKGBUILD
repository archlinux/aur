pkgname=python-dendropy
_module='DendroPy'
pkgver=5.0.13
pkgrel=1
pkgdesc="A Python library for phylogenetics and phylogenetic computing: reading, writing, simulation, processing and manipulation of phylogenetic trees (phylogenies) and characters."
url="https://github.com/jeetsukumaran/DendroPy"
depends=('python')
makedepends=('python-setuptools' 'python-pip')
license=('BSD')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6e1775853f0770957974a49486122f7472965174691b6daa11340d67fa89586b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
