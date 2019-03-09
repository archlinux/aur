# Maintainer: higgsbosoncodes higgsbosoncodes@gmail.com
# https://github.com/higgsbosoncodes
pkgname=arch-animated-startscreen
pkgver=2
pkgrel=1
epoch=
pkgdesc="Animated SDDM-Theme and Splashscreen for Archlinux (made for KDE)(Aurora Borealis Background)"
arch=("any")
url="https://github.com/higgsbosoncodes/ArchStartscreen-Animated"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/higgsbosoncodes/ArchStartscreen-Animated/archive/master.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    export LD_PRELOAD='/usr/lib/libfakeroot/libfakeroot.so'
	cd "ArchStartscreen-Animated-master"
	make
}

check() {
	cd "ArchStartscreen-Animated-master"
	make -k check
}

package() {
    export LD_PRELOAD='/usr/lib/libfakeroot/libfakeroot.so'
	cd "ArchStartscreen-Animated-master"
	make DESTDIR="$pkgdir/" install
}
