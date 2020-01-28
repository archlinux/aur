# Maintainer: ctag <bigbero@gmail.com>
pkgname=sarndbox-git
pkgver=2.6_12_gd1e51b5
pkgrel=1
pkgdesc="Augmented Reality Sandbox"
arch=('i686' 'x86_64')
url="https://github.com/KeckCAVES/SARndbox"
license=('GPL')
depends=('xorg-server' 'libgl' 'vrui-git' 'kinect-3d-git')
makedepends=('git')
source=("git+https://github.com/KeckCAVES/SARndbox.git")
md5sums=('SKIP')

pkgver() {
	cd "SARndbox"
	git describe | sed 's/^v//;s/-/_/g'
}

build() {
	cd "SARndbox"
	make VRUI_MAKEDIR="/usr/share/Vrui/make"
}

package() {
	cd "SARndbox"
	make INSTALLDIR="$pkgdir" INSTALLPREFIX="$pkgdir" VRUI_MAKEDIR="/usr/share/Vrui/make" install
}
