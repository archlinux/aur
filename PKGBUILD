_pkgname="myjdapi"
pkgname="python-$_pkgname"
pkgver=1.1.6
pkgrel=1
pkgdesc="My.Jdownloader API Python Library"
arch=('any')
depends=('python-pycryptodome' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/mmarquezs/My.Jdownloader-API-Python-Library/"
license=('MIT')

source=("https://files.pythonhosted.org/packages/source/m/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("252a9c6eee001d67bb000ceb8fdf99729c06cf46ff18a00fc89468672388de1e")

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
