# Maintainer: brionical27 <brionical@proton.me>
pkgname=sonyheadphonesclient-bluetooth-bin
pkgver=1.3.17
pkgrel=4
pkgdesc="A fork of Plutoberth's SonyHeadphonesClient by mos9527, now updated with support for Sony's newer Bluetooth/TWS devices"
arch=("x86_64")
url="https://github.com/mos9527/SonyHeadphonesClient"
license=('MIT')
depends=("glfw" "unzip" "gcc-libs" "libglvnd" "glibc" "dbus" "bluez-libs"  "dbus")
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/SonyHeadphonesClient-linux-x64"
	"MIT::https://raw.githubusercontent.com/mos9527/SonyHeadphonesClient/refs/heads/master/LICENSE")
sha256sums=(SKIP
	SKIP)
package() {
	mv $pkgname-$pkgver $srcdir/$pkgname
	chmod +x $srcdir/$pkgname
	mkdir -p "$pkgdir/usr/bin/"
	cp $srcdir/$pkgname $pkgdir/usr/bin

	mkdir -p "$pkgdir/usr/share/applications/"
	echo "[Desktop Entry]
	Name=Sony Headphones Client
	GenericName=[XM5+] A Linux client recreating the functionality of the Sony Headphones app
	Exec=sonyheadphonesclient-bluetooth
	Terminal=false
	Categories=Utility;
	Type=Application
	Icon=audio-headphones" >>"$pkgdir/usr/share/applications/sonyheadphonesclient-bluetooth.desktop"
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp MIT $pkgdir/usr/share/licenses/$pkgname

}
