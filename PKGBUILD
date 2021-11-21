# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=system76-keyboard-configurator
pkgbase=keyboard-configurator
pkgver=1.1.0
pkgrel=4
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
makedepends=('gtk3' 'rust' 'systemd')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c84c4b21c44203bdc2130a3d3638105b39b474cdd60226422b6a037d8ebb5f0f')

build() {
	cd "$pkgbase-$pkgver"
	make prefix=/usr
}

package() {
	pkgdesc="System76 GUI for managing keyboards"
	depends=('xz' 'hidapi' 'gtk3')

	cd "$pkgbase-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
}

