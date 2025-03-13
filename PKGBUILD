# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-tgtg
_name=${pkgname#python-}
pkgver=0.18.2
pkgrel=1
pkgdesc='Unoffical python client for TooGoodToGo API'
arch=(any)
url='https://github.com/ahivert/tgtg-python'
license=(GPL3)
depends=(python)
makedepends=(python-poetry)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('e6c13e6406e4223e059dc6044bf8b2b44ec32413fe77beed84b887af63bd9a29f0e28ce18bd7e711772da9eb74afa82906311a17534a02f178e5c305f3b13491')

build() {
	cd "$_name-$pkgver"
	poetry build
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
