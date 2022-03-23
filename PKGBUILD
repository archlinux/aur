# Maintainer: scybernaut <scybernaut at scybernaut dot me>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=gnome-shell-extension-tray-icons-reloaded
pkgver=22
_name=trayIconsReloaded@selfmade.pl
pkgrel=1
pkgdesc="GNOME Shell extension which bring back Tray Icons to top panel, with additional features."
arch=('any')
url="https://github.com/MartinPL/Tray-Icons-Reloaded"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/MartinPL/Tray-Icons-Reloaded/releases/download/$pkgver/$_name.zip")
sha256sums=('572f1a4349b399adc8f3d4c024a8c070d43b925d9ba26d25ce0d80041a696155')

package() {
		
	cd $srcdir
	local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	local destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"
	install -dm755 "$destdir"

	cp -r * "$destdir"
}
