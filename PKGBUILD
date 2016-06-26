# Maintainer: alive4ever <alive4ever at live dot com>
pkgname=fluxbox-theme-ciremai
pkgver=20160422
pkgrel=1
pkgdesc="Simple fluxbox theme based on OSX Yosemite look"
arch=('any')
url="https://www.box-look.org/p/1016926/"
license=('GPL')
depends=('fluxbox')
source=("173825-Ciremai.tar.gz::https://dl.opendesktop.org/api/files/download?id=1461767798")
sha256sums=('7d5b86f9333ec760a5d80f020c8cb5040d7fc4a29287537d3e908be31da0f11f')

build() {
	cd "$srcdir"
	printf "Extracting Ciremai themes to srcdir\n"
	bsdtar -xf $srcdir/Ciremai.tar.gz
}

package() {
	printf "Installing Ciremai theme to pkgdir\n"
	mkdir -p $pkgdir/usr/share/fluxbox/styles/Ciremai/pixmaps
	cd $srcdir/Ciremai
	install -m644 theme.cfg $pkgdir/usr/share/fluxbox/styles/Ciremai
	cd $srcdir/Ciremai/pixmaps
	for a in * ;
	do install -m644 $srcdir/Ciremai/pixmaps/"$a" \
	$pkgdir/usr/share/fluxbox/styles/Ciremai/pixmaps/"$a" ;
	done
	printf "Installation finished.\n"
}
