# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=1.14.3
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
sha256sums=('2f57d2c3bc87777e79ca752ba5d0210112186c48c81d8c7b4f49ee62113a8db6')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
