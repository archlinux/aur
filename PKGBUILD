# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: avi <4visekh@gmail.com>
pkgname=python-materialyoucolor
_name=materialyoucolor-python
pkgver=3.0.2
pkgrel=1
pkgdesc="Material You color algorithms for Python!"
arch=('x86_64')
url="https://github.com/T-Dynamos/materialyoucolor-python"
license=('MIT')
depends=('glibc' 'gcc-libs' 'python' 'python-pillow' 'pybind11>=2.11.0')
makedepends=( 'python-build' 'python-setuptools>=61.0.0' 'python-installer' 'python-wheel' 'pybind11>=2.11.0')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('aa013f0faea26b87b65f35d7b67f7850c7ed4b926cf1628617d088fe9ddaa9ec')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
