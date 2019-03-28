# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>
pkgname=meshup
_pkgname=MeshUp
pkgver=0.6.0
pkgrel=1
pkgdesc="Visualization tool for multibody systems based on skeletal animation and magic."
arch=(x86_64)
url="https://github.com/ORB-HD/MeshUp"
license=('MIT')
depends=('ffmpeg' 'boost-libs' 'qt5-base')
makedepends=('cmake' 'boost')
source=("https://github.com/ORB-HD/MeshUp/archive/v0.6.0.tar.gz")
sha256sums=('0110feddfd66d06173288931c00ffbc3b8cfbcaff45d3bd92a8895c04af9db3d')

build() {
	cd "$_pkgname-$pkgver"
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
}
