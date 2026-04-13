# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

pkgname=python-complexipy
_name=${pkgname#python-}
pkgver=5.2.0
pkgrel=1
pkgdesc="Blazingly fast cognitive complexity analysis for Python, written in Rust."
arch=('any')
url="https://github.com/rohaquinlop/complexipy"
depends=(
    python
    python-tomli
    python-typer
)
makedepends=(
	python-build
	python-installer
	python-wheel
    python-maturin
    python-pytest
)
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rohaquinlop/complexipy/archive/refs/tags/$pkgver.tar.gz")
md5sums=('e124fd712e3f3efeb51830a3531c4972')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
