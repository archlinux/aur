# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=('keyboard-configurator')
pkgbase=keyboard-configurator-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
makedepends=('gtk3' 'rust' 'systemd')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
	cd "$pkgbase"
	make prefix=/usr
}

package_keyboard-configurator() {
	pkgdesc="System76 GUI for managing keyboards"
	depends=('xz' 'hidapi' 'gtk3')

	cd "$pkgbase"
	make prefix=/usr DESTDIR="$pkgdir/" install
}

