# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-arpa
_pyname=arpa
pkgver=0.1.0b4
pkgrel=1
pkgdesc='Library for reading ARPA n-gram language model files'
arch=('any')
url='https://github.com/sfischer13/python-arpa'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('4b740cb8796219335dcb476297430ad47ea59c22993295a3a5c1afcda66d79db')

build() {
    cd "$_pyname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
