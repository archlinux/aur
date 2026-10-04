_pkgname="myjdapi"
pkgname="python-$_pkgname"
pkgver=1.1.11
pkgrel=1
pkgdesc="My.Jdownloader API Python Library"
arch=('any')
depends=('python-pycryptodome' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/mmarquezs/My.Jdownloader-API-Python-Library/"
license=('MIT')

source=("https://files.pythonhosted.org/packages/source/m/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('14e9d4b2f5bf1e50a6be4de3ef5b18394847254cb045816d7f00dd8b2458c748')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
