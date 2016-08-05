# Maintainer: tembleking <tembleking at gmail dot com>
pkgname=('python-haversine' 'python2-haversine')
pkgver=0.4.5
pkgrel=1
pkgdesc="Calculate the distance (in km or in miles) between two points on Earth, located by their latitude and longitude."
arch=("any")
url="https://github.com/mapado/haversine"
license=('MIT')
source=("https://github.com/mapado/haversine/archive/v$pkgver.tar.gz")

build() {
	cd "haversine-$pkgver"
	python2 setup.py build
}

package_python-haversine() {
	depends=("python")
	cd "haversine-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-haversine() {
	depends=("python2")
	cd "haversine-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
md5sums=('ae7c33906818008025dc22d547fbbe53')
