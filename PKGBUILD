# Maintainer: brionical27 <brionical@proton.me>
pkgname=sonyheadphonesclient-bluetooth-bin
pkgver=1.3.13
pkgrel=1
epoch=
pkgdesc="A fork of Plutoberth's SonyHeadphonesClient by mos9527, now updated with support for Sony's newer Bluetooth/TWS devices"
arch=("x86_64")
url="https://github.com/mos9527/SonyHeadphonesClient"
license=('MIT')
depends=("glfw" "unzip" "gcc-libs" "libglvnd" "glibc" "dbus" "bluez-libs" "glew" "glew-2.1" "dbus")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("sonyheadphonesclient-bin")
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
	mv SonyHeadphonesClient-linux-x64 sonyheadphonesclient
	mkdir -p "$pkgdir/usr/bin/"
	mv sonyheadphonesclient "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin/sonyheadphonesclient"

	mkdir -p "$pkgdir/usr/share/applications/"
	echo "[Desktop Entry]
	Name=Sony Headphones Client
	GenericName=[XM5+] A Linux client recreating the functionality of the Sony Headphones app
	Exec=sonyheadphonesclient
	Terminal=false
	Type=Application
	Icon=audio-headphones
	Categories=Accessories;" >>"$pkgdir/usr/share/applications/sonyheadphonesclient.desktop"

#	License
#	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
#	cp MIT "$pkgdir/usr/share/licenses/$pkgname/"
}
