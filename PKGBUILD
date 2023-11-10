# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=1.6.1
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
sha256sums=('b2098276dacf8356df420dd7804714828b6a560307ed43e7c6ec395b432b1082')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
