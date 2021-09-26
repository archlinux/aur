# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=keyboard-configurator
pkgver=1.0.0
pkgrel=2
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
makedepends=('gtk3' 'rust' 'systemd' 'git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
	cd "$pkgbase"
	make prefix=/usr
}

package() {
	depends=('xz' 'hidapi' 'gtk3')
	cd "$pkgbase"
	make prefix=/usr DESTDIR="$pkgdir/" install
}

