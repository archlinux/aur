pkgname=python-dendropy
_module='DendroPy'
pkgver=5.0.8
pkgrel=1
pkgdesc="A Python library for phylogenetics and phylogenetic computing: reading, writing, simulation, processing and manipulation of phylogenetic trees (phylogenies) and characters."
url="https://github.com/jeetsukumaran/DendroPy"
depends=('python')
makedepends=('python-setuptools' 'python-pip')
license=('BSD')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e1ff9e9634c786cb4482d72304d8554cdb89acaf93b26914a6db3c28f78bbd26')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
