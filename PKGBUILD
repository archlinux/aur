# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="airpad"
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Basic text editor"
arch=("x86_64")
url="https://gitlab.com/oktopod11/airpad"
license=("GPL3")
groups=()
depends=("gtk3" "xdg-utils") 
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/oktopod11/airpad/raw/master/archive/airpad-0.1.tar.gz")
noextract=()
sha256sums=("f31389300a57eb1c190c47429fe9a85074e2d280012ae2e4ebc8da003a226e62")

build() {
	cd "$srcdir/$pkgname"
	make build RELEASE=release
	make link
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
	make install INSTALLDIR="$pkgdir/usr/bin/" ICONSDIR="$pkgdir/usr/share/icons/hicolor/" APPDIR="$pkgdir/usr/share/applications/"
}

