# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Robin Opletal <fourstepper@users.noreply.github.com>
# Contributor: Charlie Haley <charlie-haley@users.noreply.github.com>
pkgname=wofi-wifi-menu-git
_pkgname=wofi-wifi-menu
pkgver=25.30e42e6
pkgrel=1
pkgdesc="bash script providing WiFi menu for wofi"
arch=('any')
url='https://github.com/fourstepper/wofi-wifi-menu'
license=('unknown')
install=wofi-wifi-menu.install
depends=('wofi' 'networkmanager' 'bc' 'wireless_tools')
makedepends=('git')
source=('git+https://github.com/fourstepper/wofi-wifi-menu')
sha256sums=('SKIP')
provides=('wofi-wifi-menu')
conflicts=('wofi-wifi-menu')

pkgver() {
	cd ${_pkgname}
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "$srcdir/$_pkgname/wofi-wifi-menu.sh" "$pkgdir/usr/bin/wofi-wifi-menu"
	install -Dm555 "$srcdir/$_pkgname/config.example" "$pkgdir/usr/share/wofi/wifi.example"
}
