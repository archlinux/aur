# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: SanskritFritz (gmail)

pkgname=gpxviewer
pkgver=1.2.0
pkgrel=1
pkgdesc="GPS trace viewer"
arch=('any')
url="https://github.com/andrewgee/gpxviewer"
license=('GPL3')
depends=('python-matplotlib' 'python-cairo' 'python-gobject' 'python-dateutil' 'python-gpxpy' 'osm-gps-map')
makedepends=('python-distutils-extra')
source=("https://github.com/andrewgee/gpxviewer/archive/refs/tags/1.2.0.tar.gz")
sha256sums=('541bf661dd777581054747b8fdd489362fada8b924a0e372743d4833b99f5c27')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
}
