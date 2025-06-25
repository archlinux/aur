# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>

pkgname=python-pycifrw
pkgver=5.0.1
pkgrel=2
pkgdesc='CIF/STAR file support for Python'
arch=(any)
url=https://github.com/jamesrhester/pycifrw
license=(Python-2.0)
depends=(python python-prettytable python-ply python-numpy)
makedepends=(python-build python-installer python-wheel python-setuptools)
_name=${pkgname#python-}
source=(https://github.com/jamesrhester/${_name}/archive/v${pkgver}/${_name}-${pkgver}.tar.gz)
sha512sums=('88c11147bf7e718f596388f037a1614fedd338a59c81722668429bbf40c5a70357700766256d1d4074f9915c847ecd1fa384b8d5a51c489ea75ab0d441c24712')

build() {
    cd ${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
