# Maintainer: ctag <bigbero@gmail.com>
pkgname=kinect-3d-git
pkgver=3.7_21_gdb5f641
pkgrel=1
pkgdesc="Kinect 3D Video Capture Project"
arch=('i686' 'x86_64')
url="https://github.com/KeckCAVES/Kinect"
license=('GPL')
depends=('xorg-server' 'libgl' 'vrui-git')
makedepends=('git')
source=("git+https://github.com/KeckCAVES/Kinect.git")
md5sums=('SKIP')

pkgver() {
	cd "Kinect"
	git describe | sed 's/^v//;s/-/_/g'
}

build() {
	cd "Kinect"
	make VRUI_MAKEDIR="/usr/share/Vrui/make"
}

package() {
	cd "Kinect"
	make INSTALLPREFIX="$pkgdir" VRUI_MAKEDIR="/usr/share/Vrui/make" install
	rm "$pkgdir/usr/bin/AlignPoints"
}
