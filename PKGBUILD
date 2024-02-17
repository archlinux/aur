# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-tgtg
_name=${pkgname#python-}
pkgver=0.17.0
pkgrel=1
pkgdesc='Unoffical python client for TooGoodToGo API'
arch=(any)
url='https://github.com/ahivert/tgtg-python'
license=(GPL3)
depends=(python)
makedepends=(python-poetry)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('6103ca49691cec152d7ec78250ed523027371f53af517b4e3656520f0527d6e614bb0dbad51f4ca743162f7359646b436ee9c8ef69b94dccc7368b888e80d130')

build() {
	cd "$_name-$pkgver"
	poetry build
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
