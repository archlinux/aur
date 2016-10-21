# Maintainer: Claudio Lanconelli <lancos@libero.it>

pkgname=ponyprog-bin
pkgver=2.08d
pkgrel=1
epoch=
pkgdesc="PonyProg is a serial device programmer based on some simple and cheap interfaces for the PC"
arch=('any')
url="http://www.LancOS.com"
license=('GPL')
groups=()
depends=("libx11" "libxt" "libxext" "libxaw")
makedepends=("imagemagick")
checkdepends=()
optdepends=()
provides=()
conflicts=('ponyprog')
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/project/ponyprog/PonyProg%20sources/PonyProg2000-2.08d.tar.gz"
        "ponyprog.desktop")
noextract=()
md5sums=("19d12a550d1ce7b4f034a918e04dbe2a"
         "614b9bcd0a846373b4c32de89ec2bd71")
validpgpkeys=()

package() {
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/bin"
	mkdir -p "$pkgdir/usr/share/pixmaps"

	cp "ponyprog.desktop" "$pkgdir/usr/share/applications"
	cd "PonyProg-$pkgver"
	cp "bin/ponyprog2000" "$pkgdir/usr/bin"
	convert ponyprog.ico ponyprog.png
	cp -r "ponyprog.png" "$pkgdir/usr/share/pixmaps"
}
