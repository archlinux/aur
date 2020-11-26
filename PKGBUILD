# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=galaxybuds-batterylevel-git
pkgver=r17.dfbb315
pkgrel=1
pkgdesc="Simple python script to read battery values and the current wearing status from the Samsung Galaxy Buds and Buds+"
arch=(any)
url="https://github.com/ThePBone/GalaxyBuds-BatteryLevel"
license=('MIT')
depends=(python python-pybluez)
makedepends=()
source=('GalaxyBuds-BatteryLevel::git+https://github.com/ThePBone/GalaxyBuds-BatteryLevel.git')
md5sums=('SKIP')

pkgver() {
	cd "GalaxyBuds-BatteryLevel"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/GalaxyBuds-BatteryLevel/buds_battery.py $pkgdir/usr/bin/galaxybuds-batterylevel
}
