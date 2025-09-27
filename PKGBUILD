# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=gnome-shell-extension-pano
pkgname=${_pkgbase}-bin
pkgver=23.alpha5
pkgrel=3
pkgdesc="Next-gen Clipboard Manager for Gnome Shell "
arch=('any')
url="https://github.com/oae/gnome-shell-pano"
license=('GPL-2.0')
depends=(
	'gnome-shell>=45'
	'libgda6'
)
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("pano-${pkgver}.zip::https://github.com/oae/gnome-shell-pano/releases/download/v${pkgver/\./-}/pano@elhan.io.zip")
sha256sums=('b72a5b243a621ff73539b88c970c2e78041e3b67c9b32de24107b6383aa4be0b')
noextract=("pano-${pkgver}.zip")

prepare() {
	cd "$srcdir"
	mkdir -p "pano-${pkgver}"
	bsdtar -xf "pano-${pkgver}.zip" -C "pano-${pkgver}"
}

package() {
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/pano@elhan.io"
	cp -r "$srcdir/pano-${pkgver}/"* "$pkgdir/usr/share/gnome-shell/extensions/pano@elhan.io"
}
