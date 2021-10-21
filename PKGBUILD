# Maintainer: Guoyi Zhang <GuoyiZhang at malacology dot net>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=gnome-shell-extension-tray-icons-reloaded
pkgver=17
_name=trayIconsReloaded@selfmade.pl
pkgrel=1
pkgdesc="GNOME Shell extension which bring back Tray Icons to top panel, with additional features."
arch=('any')
url="https://github.com/MartinPL/Tray-Icons-Reloaded"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/MartinPL/Tray-Icons-Reloaded/releases/download/$pkgver/$_name.zip")
sha256sums=('aea76e40e5abe29b91efff76d184b0747e1f29991b0246cdc18e02030a06d01b')

package() {
		
	cd $srcdir
	local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	local destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"
	install -dm755 "$destdir"

	cp -r * "$destdir"
}
