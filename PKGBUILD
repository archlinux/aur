# Maintainer: hashworks <mail@hashworks.net>

pkgname=brickstrap-git
pkgver=r32.69925f0
pkgrel=1
pkgdesc='Tool for bootstrapping Debian and creating bootable image files for embedded systems, f.e. ev3dev'
url='https://github.com/ev3dev/brickstrap'
license=('MIT')
arch=('any')
depends=('docker' 'libguestfs')
optdepends=('qemu-arm-static: Build arm images (f.e. LEGO ev3 bricks)')
source=('git+https://github.com/ev3dev/brickstrap.git')
md5sums=('SKIP')

pkgver() {
	cd "brickstrap"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "brickstrap"
	install -Dm755 src/brickstrap.sh $pkgdir/usr/bin/brickstrap
}
