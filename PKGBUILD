# Maintainer: Dominik Schwaiger <domi.schwaiger04@gmail.com>
pkgname=sonyheadphonesclient-bin
pkgver=1.3.2
pkgrel=1
epoch=0
pkgdesc="A {Windows, macOS, Linux} client recreating the functionality of the Sony Headphones app"
arch=("x86_64")
url="https://github.com/Plutoberth/SonyHeadphonesClient"
license=('custom:MIT')
groups=()
depends=("glfw-x11" "minizip" "dbus" "bluez-libs" "glew" "glew-2.1" "dbus")
makedepends=()
checkdepends=()
optdepends=("glfw-doc")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Plutoberth/SonyHeadphonesClient/releases/download/v$pkgver/SonyHeadphonesClient-linux-x64.zip" "MIT")
noextract=()
md5sums=("SKIP" "SKIP")
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
	unzip -o -qq "SonyHeadphonesClient-linux-x64.zip"
	rm "SonyHeadphonesClient-linux-x64.zip"
	mkdir -p "$pkgdir/usr/bin/"
	mv SonyHeadphonesClient "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin/SonyHeadphonesClient"

	# Desktop entry
	mkdir -p "$pkgdir/usr/share/applications/"
	echo "[Desktop Entry]
	Name=Sony Headphones Client
	Exec=SonyHeadphonesClient
	Terminal=falsey
	Type=Application
	Icon=application-executable
	Categories=Accessoires;" >>"$pkgdir/usr/share/applications/SonyHeadphonesClient.desktop"

	# License
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	cp MIT "$pkgdir/usr/share/licenses/$pkgname/"
}
