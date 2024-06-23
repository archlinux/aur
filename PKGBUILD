# Maintainer: SysAdm <sysadm.archlinux@proton.me>
# Contributor: Asuka Minato
pkgname=caido-desktop
pkgver=0.38.0
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=('x86_64')
url="https://caido.io/"
license=('private')
depends=(glibc gcc-libs cairo glib2 hicolor-icon-theme dbus gtk3 gdk-pixbuf2 webkit2gtk pango)
provides=(caido caido-backend)
source=("https://storage.googleapis.com/caido-releases/v${pkgver}/caido-desktop-v${pkgver}-linux-x86_64.AppImage")
sha256sums=('1786c0ae8f8191a7709c90fcfdf3ac84edaeacf7e414679b4287ab29c19b5104')

prepare() {
	chmod +x *.AppImage
	./*.AppImage --appimage-extract
	mv squashfs-root/* ./
	rm -vrf ./usr/{lib,share/glib-2.0}
}

package() {
	cp -av usr $pkgdir/
}
