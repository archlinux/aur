# Maintainer: brionical27 <brionical@proton.me>
pkgname=sonyheadphonesclient-bluetooth-bin
pkgver=1.3.16
pkgrel=3
epoch=
pkgdesc="A fork of Plutoberth's SonyHeadphonesClient by mos9527, now updated with support for Sony's newer Bluetooth/TWS devices"
arch=("x86_64")
url="https://github.com/mos9527/SonyHeadphonesClient"
license=('MIT')
depends=("glfw" "unzip" "gcc-libs" "libglvnd" "glibc" "dbus" "bluez-libs"  "dbus")
makedepends=()
checkdepends=()
optdepends=()
provides=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/releases/download/$pkgver/SonyHeadphonesClient-linux-x64")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	mv SonyHeadphonesClient-linux-x64 sonyheadphonesclient-bluetooth
	mkdir -p "$pkgdir/usr/bin/"
	mv sonyheadphonesclient-bluetooth "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin/sonyheadphonesclient-bluetooth"

	mkdir -p "$pkgdir/usr/share/applications/"
	echo "[Desktop Entry]
	Name=Sony Headphones Client
	GenericName=[XM5+] A Linux client recreating the functionality of the Sony Headphones app
	Exec=sonyheadphonesclient-bluetooth
	Terminal=false
	Categories=Utility;
	Type=Application
	Icon=audio-headphones" >>"$pkgdir/usr/share/applications/sonyheadphonesclient-bluetooth.desktop"

#	License
#	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
#	cp MIT "$pkgdir/usr/share/licenses/$pkgname/"
}
