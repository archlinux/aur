# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: avi <4visekh@gmail.com>
pkgname=python-materialyoucolor
_name=materialyoucolor-python
pkgver=3.0.4
pkgrel=1
pkgdesc="Material You color algorithms for Python!"
arch=('x86_64')
url="https://github.com/T-Dynamos/materialyoucolor-python"
license=('MIT')
depends=('glibc' 'gcc-libs' 'python' 'python-pillow' 'pybind11>=2.11.0')
makedepends=( 'python-build' 'python-setuptools>=61.0.0' 'python-installer' 'python-wheel' 'pybind11>=2.11.0')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('1c7c7d4e57ac39d05f0aed767e7534e9a845b288807493915c9c478203b4bae1')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
