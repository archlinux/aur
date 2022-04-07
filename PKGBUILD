# Maintainer: scybernaut <scybernaut at scybernaut dot me>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=gnome-shell-extension-tray-icons-reloaded
pkgver=23
_name=trayIconsReloaded@selfmade.pl
pkgrel=1
pkgdesc="GNOME Shell extension which bring back Tray Icons to top panel, with additional features."
arch=('any')
url="https://github.com/MartinPL/Tray-Icons-Reloaded"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/MartinPL/Tray-Icons-Reloaded/releases/download/$pkgver/$_name.zip")
sha256sums=('e61ff6e3bcc2c3a33d7819650bec052ec07b8e49d66b4d62c676cef5f86b8ed4')

package() {
		
	cd $srcdir
	local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	local destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"
	install -dm755 "$destdir"

	cp -r * "$destdir"
}
