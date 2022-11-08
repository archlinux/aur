# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=xcursor-simp1e
pkgname=(xcursor-simp1e{-breeze{,-snow},{,-adw}{,-dark},-catpuccin-{frappe,latte,macchiato,mocha},-{solarized,gruvbox,nord}-{dark,light},-tokyo-night{,-light,-storm}})
pkgdesc='An aesthetic cursor theme'
pkgver=20221103.2
pkgrel=1
url=https://gitlab.com/cursors/simp1e
arch=(any)
makedepends=(git librsvg python-pillow xorg-xcursorgen)
depends=()
license=(GPL3)
source=("${pkgbase}::git+${url}.git/#tag=${pkgver}"
		"cursor-generator::git+https://gitlab.com/cursors/cursor-generator.git/")
sha512sums=(SKIP SKIP)

prepare () {
	cd "${pkgbase}"
	git submodule init
	git config submodule.cursor-generator.url "${srcdir}/cursor-generator"
	git -c protocol.file.allow=always submodule update
}

build () {
	cd "${pkgbase}"
	./build.sh
}

_package () {
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -a "${pkgbase}/built_themes/$1" "${pkgdir}/usr/share/icons"
}

package_xcursor-simp1e () {
	_package Simp1e
}
package_xcursor-simp1e-dark () {
	_package Simp1e-Dark
}
package_xcursor-simp1e-adw () {
	_package Simp1e-Adw
}
package_xcursor-simp1e-adw-dark () {
	_package Simp1e-Adw-Dark
}
package_xcursor-simp1e-breeze () {
	_package Simp1e-Breeze
}
package_xcursor-simp1e-breeze-snow () {
	_package Simp1e-Breeze-Snow
}
package_xcursor-simp1e-solarized-light () {
	replaces=(xcursor-simp1e-solarized)
	_package Simp1e-Solarized-Light
}
package_xcursor-simp1e-solarized-dark () {
	_package Simp1e-Solarized-Dark
}
package_xcursor-simp1e-gruvbox-light () {
	_package Simp1e-Gruvbox-Light
}
package_xcursor-simp1e-gruvbox-dark () {
	_package Simp1e-Gruvbox-Dark
}
package_xcursor-simp1e-nord-light () {
	_package Simp1e-Nord-Light
}
package_xcursor-simp1e-nord-dark () {
	_package Simp1e-Nord-Dark
}
package_xcursor-simp1e-tokyo-night () {
	_package Simp1e-Tokyo-Night
}
package_xcursor-simp1e-tokyo-night-light () {
	_package Simp1e-Tokyo-Night-Light
}
package_xcursor-simp1e-tokyo-night-storm () {
	_package Simp1e-Tokyo-Night-Light
}
package_xcursor-simp1e-catpuccin-frappe () {
	replaces=(xcursor-simp1e-catpuccin)
	_package Simp1e-Catppuccin-Frappe
}
package_xcursor-simp1e-catpuccin-latte () {
	_package Simp1e-Catppuccin-Latte
}
package_xcursor-simp1e-catpuccin-macchiato () {
	_package Simp1e-Catppuccin-Macchiato
}
package_xcursor-simp1e-catpuccin-mocha () {
	_package Simp1e-Catppuccin-Mocha
}
