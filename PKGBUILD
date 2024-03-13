# Maintainer: Tomasz Zok <tomasz dot zok (at) gmail dot com>
pkgbase='python-rnapolis'
pkgname='python-rnapolis'
_name='RNApolis'
pkgver='0.3.6'
pkgrel=1
pkgdesc="A Python library containing RNA-related bioinformatics functions and classes"
url="https://github.com/tzok/rnapolis-py"
depends=(python python-appdirs python-graphviz python-mmcif python-numpy python-ordered-set python-orjson python-pulp python-requests python-scipy python-rna)
makedepends=(python-setuptools python-build python-installer python-wheel)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name/-/_}-${pkgver}.tar.gz")
sha256sums=('0dcb73d407198d92a4e0a91a328d0386b37facffb2ceea77d7e80e539befcdf3')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
