# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-rectpack
pkgver=0.2.2
pkgrel=1
pkgdesc='2D Rectangle packing library'
arch=('any')
url='https://github.com/secnot/rectpack/'
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/r/rectpack/rectpack-${pkgver}.tar.gz")
sha256sums=('15e383505fdfbaeb55ec640a5825d9ca2ce89019a6cdd552d6e57ec36c68ba2a')

build() {
    cd "rectpack-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "rectpack-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
