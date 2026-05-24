# Maintainer: Alberto Perillo <alberto@perillo.uy>
pypkgname=telnetlib3
pkgname=python-${pypkgname}
pkgver=4.0.4
pkgrel=1
pkgdesc="telnetlib3 is a feature-rich Telnet Server, Client, and Protocol library for Python 3.9 and newer."
arch=('any')
url="https://pypi.org/project/telnetlib3/"
license=('ISCL')
depends=('python' 'python-wcwidth' 'python-hatchling')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pypkgname::1}/${pypkgname}/${pypkgname}-${pkgver}.tar.gz")
sha256sums=('6ab9ce0b9e8663b002d7e10513deb0c17bddb982d520681e0788511d99695a7a')

build() {
    cd "${pypkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pypkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
