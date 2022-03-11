# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pur
_pkgname=${pkgname:7}
pkgver=6.0.1
pkgrel=1
pkgdesc="Update packages in a requirements.txt file to latest versions."
arch=('any')
url="https://pypi.org/project/pur"
license=('BSD license')
makedepends=(python-build python-installer)
depends=('python-click')
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('b8f701f8ed0dd424e2fab694866e5cac3954b5fa8dc2c1cd02c12b1d3c7660d7')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
