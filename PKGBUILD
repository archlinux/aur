_pkgname="myjdapi"
pkgname="python-$_pkgname"
pkgver=1.1.9
pkgrel=1
pkgdesc="My.Jdownloader API Python Library"
arch=('any')
depends=('python-pycryptodome' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/mmarquezs/My.Jdownloader-API-Python-Library/"
license=('MIT')

source=("https://files.pythonhosted.org/packages/source/m/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7b49fa186241febd0a2f68748b2b05572b70bdcc2c5cb47b3863b38512640160')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
