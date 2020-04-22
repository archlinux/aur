# Maintainer: hashworks <mail@hashworks.net>

pkgname=brickstrap-git
pkgver=0.6.8.r4.ga48aea5
pkgrel=1
pkgdesc='Tool for bootstrapping Debian and creating bootable image files for embedded systems'
url='https://github.com/ev3dev/brickstrap'
license=('MIT')
arch=('any')
depends=('docker' 'libguestfs')
optdepends=('qemu-arm-static: Build arm images (f.e. LEGO ev3 bricks)')
source=('git+https://github.com/ev3dev/brickstrap.git')
md5sums=('SKIP')

pkgver() {
	cd "brickstrap"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "brickstrap"
	install -Dm755 src/brickstrap.sh $pkgdir/usr/bin/brickstrap
}
