# Maintainer: Riccardo Berto <riccardobrt at gmail dot com>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname='python-alpha-vantage'
_pkgname='alpha_vantage'
pkgver=1.8.0
pkgrel=1
pkgdesc="Python module to get stock data from the Alpha Vantage API."
arch=("any")
url="https://github.com/RomelTorres/alpha_vantage"
license=('MIT')
depends=("python" "python-requests" "python-simplejson" "python-pandas")
makedepends=("python-setuptools")
source=("$url/archive/$pkgver.tar.gz")
md5sums=('645699c44e681b3ccba0f29a076c8446')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
