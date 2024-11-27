# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-tgtg
_name=${pkgname#python-}
pkgver=0.18.1
pkgrel=1
pkgdesc='Unoffical python client for TooGoodToGo API'
arch=(any)
url='https://github.com/ahivert/tgtg-python'
license=(GPL3)
depends=(python)
makedepends=(python-poetry)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('a22797dd339924a410f542f479874cab88f32285794e755f7119b106982fe7b6f73e12f4b6841c2aa4f77f002c689413e219188b922211317cf2fbf8d78c3b10')

build() {
	cd "$_name-$pkgver"
	poetry build
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
