_pkgname="myjdapi"
pkgname="python-$_pkgname"
pkgver=1.1.7
pkgrel=1
pkgdesc="My.Jdownloader API Python Library"
arch=('any')
depends=('python-pycryptodome' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/mmarquezs/My.Jdownloader-API-Python-Library/"
license=('MIT')

source=("https://files.pythonhosted.org/packages/source/m/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3a6c56fb14608e147214e7c6a6499f6d6ec047502c24cb11b77a23cf3ef6ea92')

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
