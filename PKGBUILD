# Maintainer: Tomasz Zok <tomasz dot zok (at) gmail dot com>
pkgbase='python-rnapolis'
pkgname='python-rnapolis'
_name='rnapolis'
pkgver='0.4.17'
pkgrel=1
pkgdesc="A Python library containing RNA-related bioinformatics functions and classes"
url="https://github.com/tzok/rnapolis-py"
depends=(python python-appdirs python-graphviz python-mmcif python-numpy python-ordered-set python-orjson python-pandas python-pulp python-requests python-scipy python-rna)
makedepends=(python-setuptools python-build python-installer python-wheel)
optdepends=('highs: Linear optimization software [when present, pseudoknot order assignment is solved much faster in RNApolis]')
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name/-/_}-${pkgver}.tar.gz")
sha256sums=('b762efdae752a52db957b5bf4261417a80cf3f229542345aceb704cd651b3257')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
