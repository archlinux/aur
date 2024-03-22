# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=1.14.0
pkgrel=1
pkgdesc="An update notifier/applier that assists you with important pre/post update tasks."
arch=('any')
url="https://github.com/Antiz96/arch-update"
license=('GPL-3.0-or-later')
depends=('bash' 'pacman-contrib' 'curl' 'htmlq' 'diffutils')
optdepends=('yay: AUR support'
	    'paru: AUR support'
	    'flatpak: Flatpak support'
	    'libnotify: Desktop notification support'
	    'vim: Default merge program for pacdiff'
	    'sudo: Privilege elevation'
	    'doas: Privilege elavation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('541f6e5c6b61a87c7e4561f1ba011ab4103a589145a7db967e7f7b8936969fbe')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
