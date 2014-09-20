# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=ideviceactivate-git
pkgver=13.c450643
pkgrel=2
pkgdesc="Restores firmware and filesystem to iPhone/iPod Touch"
arch=('i686' 'x86_64')
url="http://github.com/posixninja/ideviceactivate"
license=('custom')
depends=('usbmuxd' 'libirecovery-git' 'libimobiledevice-git')
makedepends=('git')
source=("git://github.com/posixninja/ideviceactivate")
md5sums=('SKIP')


pkgver() {
	cd ideviceactivate
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd ideviceactivate
	make
}

package() {
	cd ideviceactivate
	install -Dm755 src/ideviceactivate "$pkgdir/usr/bin/ideviceactivate"
}
