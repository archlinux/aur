# Maintainer: scybernaut <scybernaut at scybernaut dot me>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=gnome-shell-extension-tray-icons-reloaded
pkgver=24
_name=trayIconsReloaded@selfmade.pl
pkgrel=1
pkgdesc="GNOME Shell extension which bring back Tray Icons to top panel, with additional features."
arch=('any')
url="https://github.com/MartinPL/Tray-Icons-Reloaded"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/MartinPL/Tray-Icons-Reloaded/releases/download/$pkgver/$_name.zip")
sha256sums=('48ac55a07060da24680b2411507e5d8ea261b64412c9652b960fce0aee668a0d')

package() {
		
	cd $srcdir
	local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	local destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"
	install -dm755 "$destdir"

	cp -r * "$destdir"
}
