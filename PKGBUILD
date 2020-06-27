# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: SanskritFritz

pkgname=gpxviewer
pkgver=1.1.0
pkgrel=1
pkgdesc="GPS trace viewer"
arch=('any')
url="http://andrewgee.org/blog/projects/gpxviewer/"
license=('GPL3')
depends=('python-matplotlib' 'python-cairo' 'python-gobject' 'python-dateutil' 'python-gpxpy' 'osm-gps-map')
makedepends=('python-distutils-extra')
source=("http://andrewgee.org/downloads/gpxviewer/gpxviewer-$pkgver.tar.gz")
sha256sums=('9630334e58961fc61e00d32e87b6afb06f1d53fc2ed7c9371781a4e615f79671')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
}
