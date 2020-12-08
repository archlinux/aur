# Maintainer: Justin Dray <justin@dray.be>
# Contributor: surefire@cryptomile.net

_srcname=Tray-Icons-Reloaded
pkgname=gnome-shell-extension-tray-icons-reloaded-git
pkgver=11+0+g3d726e0
pkgrel=1
pkgdesc="Shows legacy tray icons on top."
arch=('any')
url="https://extensions.gnome.org/extension/1031/topicons/"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
conflicts=('gnome-shell-extension-tray-icons-reloaded')
provides=('gnome-shell-extension-tray-icons-reloaded')
groups=('gnome-shell-extensions')
source=("git+https://github.com/MartinPL/${_srcname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_srcname}"
	git describe --tags --long | sed 's/^v//; s/-/+/g'
}

package() {
	cd "${_srcname}"
	local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	local destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"
	install -dm755 "$destdir"

	cp -r * "$destdir"
  
}
