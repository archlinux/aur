# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>

pkgname=python-pycifrw
pkgver=5.0
pkgrel=1
pkgdesc='CIF/STAR file support for Python'
arch=(any)
url=https://github.com/jamesrhester/pycifrw
license=(Python-2.0)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
_name=${pkgname#python-}
source=(https://github.com/jamesrhester/${_name}/archive/v${pkgver}/${_name}-${pkgver}.tar.gz)
sha512sums=('58d1b287d2f3e81fc79b163e49873917563a2e6b0314168424fbeae20545f14f88ebbaf5180d7e97a06b25d56121685532d3035f38ac888906db9f43a1aa6df4')

build() {
    cd ${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
