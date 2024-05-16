# Maintainer: Philipp Marmet <fujexo@c0d3.ch>
pkgname=gnome-shell-extension-headsetcontrol
pkgver=46.4
pkgrel=1
pkgdesc="Gnome Shell Extension to visualize headset status from HeadsetControl "
arch=('any')
url="https://github.com/ChrisLauinger77/gnome-shell-extension-HeadsetControl"
license=('GPL')
depends=('gnome-shell' 'headsetcontrol')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d9b5e5e8b8d467118d84c68c83818c2df30c8837b46e4616a355801c8d6afd8a')
_extension_name="HeadsetControl@lauinger-clan.de"
_source_name="gnome-shell-extension-HeadsetControl"

package() {
	cd "$_source_name-$pkgver"
	gnome-extensions pack "${_extension_name}" --podir="../po" --extra-source="../LICENSE" --force

	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/${_extension_name}"
	bsdtar -xvf "${_extension_name}.shell-extension.zip" -C "$pkgdir/usr/share/gnome-shell/extensions/${_extension_name}"
}
