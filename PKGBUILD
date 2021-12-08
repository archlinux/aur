# Maintainer: Guoyi Zhang <GuoyiZhang at malacology dot net>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=gnome-shell-extension-tray-icons-reloaded
pkgver=19
_name=trayIconsReloaded@selfmade.pl
pkgrel=1
pkgdesc="GNOME Shell extension which bring back Tray Icons to top panel, with additional features."
arch=('any')
url="https://github.com/MartinPL/Tray-Icons-Reloaded"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/MartinPL/Tray-Icons-Reloaded/releases/download/$pkgver/$_name.zip")
sha256sums=('4df32df22fc8db30f21fd218feb813e17cfe31a6db233481d1d8fea4f055e539')

package() {
		
	cd $srcdir
	local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	local destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"
	install -dm755 "$destdir"

	cp -r * "$destdir"
}
