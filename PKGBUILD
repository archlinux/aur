# Maintainer: brionical27 <brionical@proton.me>
pkgname=sonyheadphonesclient-bluetooth-bin
pkgver=1.3.17
pkgrel=1
pkgdesc="A fork of Plutoberth's SonyHeadphonesClient by mos9527, now updated with support for Sony's newer Bluetooth/TWS devices"
arch=("x86_64")
url="https://github.com/mos9527/SonyHeadphonesClient"
license=('MIT')
depends=("glfw" "unzip" "gcc-libs" "libglvnd" "glibc" "dbus" "bluez-libs"  "dbus")
source=("$url/releases/download/$pkgver/SonyHeadphonesClient-linux-x64")
sha256sums=('SKIP')
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
}
