# Maintainer: Alberto Perillo <alberto@perillo.uy>
pypkgname=telnetlib3
pkgname=python-${pypkgname}
pkgver=5.0.0
pkgrel=1
pkgdesc="telnetlib3 is a feature-rich Telnet Server, Client, and Protocol library for Python 3.9 and newer."
arch=('any')
url="https://pypi.org/project/telnetlib3/"
license=('ISCL')
depends=('python' 'python-wcwidth' 'python-hatchling')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pypkgname::1}/${pypkgname}/${pypkgname}-${pkgver}.tar.gz")
sha256sums=('b5387d811a270b98698081083a7843530c44765c0a023e3cab6fe8d81f8a2c73')
build() {
    cd "${pypkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pypkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
