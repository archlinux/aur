# Maintainer: Alberto Perillo <alberto@perillo.uy>
pypkgname=telnetlib3
pkgname=python-${pypkgname}
pkgver=4.0.5
pkgrel=1
pkgdesc="telnetlib3 is a feature-rich Telnet Server, Client, and Protocol library for Python 3.9 and newer."
arch=('any')
url="https://pypi.org/project/telnetlib3/"
license=('ISCL')
depends=('python' 'python-wcwidth' 'python-hatchling')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pypkgname::1}/${pypkgname}/${pypkgname}-${pkgver}.tar.gz")
sha256sums=('37f584609917a3394302cac6c2f78683add80115820c19a4ce35e0fd499f6ad6')

build() {
    cd "${pypkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pypkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
