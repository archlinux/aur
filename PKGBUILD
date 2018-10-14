# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Petrov Vladislav <ejiek@mail.ru>
pkgname=rofi-wifi-menu-git
_pkgname=rofi-wifi-menu
pkgver=25.30e42e6
pkgrel=1
pkgdesc="bash script providing WiFi menu for rofi"
arch=('any')
url='https://github.com/zbaylin/rofi-wifi-menu'
license=('unknown')
install=rofi-wifi-menu.install
depends=('rofi' 'networkmanager' 'bc' 'wireless_tools')
makedepends=('git')
source=('git+https://github.com/zbaylin/rofi-wifi-menu')
sha256sums=('SKIP')
provides=('rofi-wifi-menu')
conflicts=('rofi-wifi-menu')

pkgver() {
	cd ${_pkgname}
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "$srcdir/$_pkgname/rofi-wifi-menu.sh" "$pkgdir/usr/bin/rofi-wifi-menu"
	install -Dm555 "$srcdir/$_pkgname/config.example" "$pkgdir/usr/share/rofi/wifi.example"
}
