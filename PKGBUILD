# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-tgtg
_name=${pkgname#python-}
pkgver=0.18.0
pkgrel=1
pkgdesc='Unoffical python client for TooGoodToGo API'
arch=(any)
url='https://github.com/ahivert/tgtg-python'
license=(GPL3)
depends=(python)
makedepends=(python-poetry)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('268c4b2bdaa331daf3cd06bdac89340d036e1734b819feac8279a72ef0b7e72678d3a43a09c16397f89c5a1ea4d0b7ef48da410ea3eed960fe63f0ef53698e8c')

build() {
	cd "$_name-$pkgver"
	poetry build
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
