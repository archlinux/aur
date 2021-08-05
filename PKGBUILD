# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=system76-keyboard-configurator
pkgbase=system76-keyboard-configurator
pkgver=1.0.0
pkgrel=2
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
makedepends=('gtk3' 'rust' 'systemd')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96d2afd18641c66be6503283a5d90afd6737de1f14d4425f1a2e45057411043c')

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

