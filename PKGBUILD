# Maintainer: Tomasz Zok <tomasz dot zok (at) gmail dot com>
pkgbase='python-rnapolis'
pkgname='python-rnapolis'
_name='RNApolis'
pkgver='0.3.9'
pkgrel=1
pkgdesc="A Python library containing RNA-related bioinformatics functions and classes"
url="https://github.com/tzok/rnapolis-py"
depends=(python python-appdirs python-graphviz python-mmcif python-numpy python-ordered-set python-orjson python-pulp python-requests python-scipy python-rna)
makedepends=(python-setuptools python-build python-installer python-wheel)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name/-/_}-${pkgver}.tar.gz")
sha256sums=('e8cbe45cfd4909bca82be4323dd12c585a179b60d0c4d94a3aa28493d2bbdcae')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
