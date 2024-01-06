# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=1.10.0
pkgrel=1
pkgdesc="An update notifier/applier that assists you with important pre/post update tasks."
arch=('any')
url="https://github.com/Antiz96/arch-update"
license=('GPL3')
depends=('pacman-contrib' 'curl' 'htmlq' 'diffutils')
optdepends=('yay: AUR support'
	    'paru: AUR support'
	    'flatpak: Flatpak support'
	    'libnotify: Desktop notification support'
	    'vim: Default merge program for pacdiff'
	    'sudo: Privilege elevation'
	    'doas: Privilege elavation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('219ca07ac3dccc929b791d71a5da7db0098f388c5fd8bbee8d6eaa495fc12599')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
