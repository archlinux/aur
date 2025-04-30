# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-tgtg
_name=${pkgname#python-}
pkgver=0.18.3
pkgrel=1
pkgdesc='Unoffical python client for TooGoodToGo API'
arch=(any)
url='https://github.com/ahivert/tgtg-python'
license=(GPL3)
depends=(python)
makedepends=(python-poetry)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('f6f6df18a246b42356e6800ac779bd3c0e029f258e67a272dc3d41c762e366b4cd79c0a19f4ea54cb35a5a13802a27c716bc76754ac039d86b769eeccd920d15')

build() {
	cd "$_name-$pkgver"
	poetry build
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
