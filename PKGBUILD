# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=pyutil
pkgname=python-pyutil
pkgver=3.3.0
pkgrel=1
pkgdesc="general-purpose python library (used by tahoe-lafs)"
arch=('any')
url='https://pypi.python.org/pypi/pyutil'
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pyutil/pyutil-${pkgver}.tar.gz")
sha256sums=('8c4d4bf668c559186389bb9bce99e4b1b871c09ba252a756ccaacd2b8f401848')

build() {
    cd "pyutil-$pkgver"
    python -m build --wheel --no-isolation
}

package_python-pyutil() {
    cd "pyutil-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -r "$pkgdir/usr/pyutil"
}
