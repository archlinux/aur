# Maintainer: Fan Chung <thesummernightcat@gmail.com>
pkgname=python-svgling
_pkgname=${pkgname:7}
pkgver=0.3.1
pkgrel=1
pkgdesc="linguistics tree drawing to SVG in python, aimed at Jupyter"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-svgwrite) 
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('a793134fa17bf1fbbcbe73cd32dab729d14fd168999b1136ea1d530a46a9d5f4')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
