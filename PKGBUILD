# Maintainer: Your Name <youremail@domain.com>
pkgname=python-materialyoucolor3
_name=materialyoucolor-python
pkgver=3.0.2
pkgrel=1
epoch=
pkgdesc="Material You color generation algorithms in python."
arch=('x86_64')
url="https://github.com/T-Dynamos/materialyoucolor-python"
license=('MIT')
groups=()
depends=('python' 'python-pillow')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'pybind11'
)
provides=('python-materialyoucolor')
conflicts=('python-materialyoucolor')
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