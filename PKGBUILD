# Maintainer: Tomasz Zok <tomasz dot zok (at) gmail dot com>
pkgbase='python-rnapolis'
pkgname='python-rnapolis'
_name='rnapolis'
pkgver='0.7.0'
pkgrel=1
pkgdesc="A Python library containing RNA-related bioinformatics functions and classes"
url="https://github.com/tzok/rnapolis-py"
depends=(python python-appdirs python-graphviz python-mmcif python-numpy python-ordered-set python-orjson python-pandas python-pulp python-requests python-scipy python-rna)
makedepends=(python-setuptools python-build python-installer python-wheel)
optdepends=('highs: Linear optimization software [when present, pseudoknot order assignment is solved much faster in RNApolis]' 
            'pymol: required to use aligner script')
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name/-/_}-${pkgver}.tar.gz")
sha256sums=('81e535b55ccede0e0b099d4f944c65678fb1e68e9a4b875c8dd15d203dfb0542')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
