# Maintainer: Alberto Perillo <alberto@perillo.uy>
pypkgname=telnetlib3
pkgname=python-${pypkgname}
pkgver=5.0.1
pkgrel=1
pkgdesc="telnetlib3 is a feature-rich Telnet Server, Client, and Protocol library for Python 3.9 and newer."
arch=('any')
url="https://pypi.org/project/telnetlib3/"
license=('ISCL')
depends=('python' 'python-wcwidth' 'python-hatchling')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pypkgname::1}/${pypkgname}/${pypkgname}-${pkgver}.tar.gz")
sha256sums=('6fde197ffb71cf26ad27fe2c88694d8364f4b1cc962a37762e0cf7e79b9afaed')
build() {
    cd "${pypkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pypkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
