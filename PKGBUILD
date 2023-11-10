# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=1.6.0
pkgrel=1
pkgdesc="An update notifier/applier that assists you with important pre/post update tasks."
arch=('any')
url="https://github.com/Antiz96/arch-update"
license=('GPL3')
depends=('pacman-contrib' 'curl' 'htmlq' 'diffutils' 'vim')
optdepends=('yay: AUR support'
	    'paru: AUR support'
	    'Flatpak: Flatpak support'
	    'libnotify: Desktop notification support'
	    'sudo: Privilege elevation'
	    'doas: Privilege elavation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6d995c2e078b1de50aded56c510366b867cda866d84145deb36d9e87fbcd1019')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
