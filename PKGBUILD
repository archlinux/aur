# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: avi <4visekh@gmail.com>
pkgname=python-materialyoucolor
_name=materialyoucolor-python
pkgver=2.0.10
pkgrel=1
pkgdesc="Material You color algorithms for Python!"
arch=('x86_64')
url="https://github.com/T-Dynamos/materialyoucolor-python"
license=('MIT')
depends=('glibc' 'gcc-libs' 'python' 'python-pillow')
makedepends=( 'python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('12057b142b2282144fb00f18d588d46898a319df2b6af669f43f802b4b75800d')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
