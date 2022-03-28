# Maintainer: Dominik Schwaiger <domi.schwaiger04@gmail.com>
pkgname=sonyheadphonesclient-bin
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="A {Windows, macOS, Linux} client recreating the functionality of the Sony Headphones app"
arch=("x86_64")
url="https://github.com/Plutoberth/SonyHeadphonesClient"
license=('MIT')
groups=()
depends=("glfw-x11")
makedepends=()
checkdepends=()
optdepends=("glfw-doc")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=sonyheadphonesclient-bin.install
changelog=
source=("https://github.com/Plutoberth/SonyHeadphonesClient/releases/download/v$pkgver/SonyHeadphonesClient-linux-x64.zip")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

# build() {
# 	cd "$pkgname-$pkgver"
# 	unzip
# }

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	unzip "SonyHeadphonesClient-linux-x64.zip"
	rm "SonyHeadphonesClient-linux-x64.zip"
	mkdir -p "$pkgdir/usr/bin/"
	mv SonyHeadphonesClient "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin/SonyHeadphonesClient"

	# Desktop entry
	mkdir -p "$pkgbuild/home/$USER/.local/share/applications/"
	touch "$pkgbuild/home/$USER/.local/share/applications/SonyHeadphonesClient.desktop"
	echo "[Desktop Entry]
	Name=Sony Headphones Client
	Exec=SonyHeadphonesClient
	Terminal=false
	Type=Application
	Icon=application-executable
	Categories=Accessoires;" >>"$pkgbuild/home/$USER/.local/share/applications/SonyHeadphonesClient.desktop"
}
