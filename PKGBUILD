# Maintainer: Louis Rannou (louson at gresille dot org)

_name=pick
pkgname=python-${_name}
pkgver=2.4.0
pkgrel=1
pkgdesc="Python library to create interactive selection list in the terminal"
arch=('any')
url="https://github.com/wong2/pick"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("$pkgname-$pkgver.tar.gz::https://github.com/wong2/pick/archive/v$pkgver.tar.gz")
md5sums=('49aaea8b110f22cb5de59f86ec5b09b3')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
