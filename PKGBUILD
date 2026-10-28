_pkgname="myjdapi"
pkgname="python-$_pkgname"
pkgver=1.1.12
pkgrel=1
pkgdesc="My.Jdownloader API Python Library"
arch=('any')
depends=('python-pycryptodome' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/mmarquezs/My.Jdownloader-API-Python-Library/"
license=('MIT')

source=("https://files.pythonhosted.org/packages/source/m/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c8aff15b8dd746bbbd461b50acae5e6fd3f356c593d7578da0ba444af0ef1707')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
