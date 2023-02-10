# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=1.5.1
pkgrel=1
pkgdesc="An update notifier/applier that assists you with important pre/post update tasks."
arch=('any')
url="https://github.com/Antiz96/arch-update"
license=('GPL3')
depends=('pacman-contrib' 'curl' 'hq' 'diffutils' 'vim')
optdepends=('yay: AUR support'
	    'paru: AUR support'
	    'libnotify: Desktop notification support'
	    'sudo: Privilege elevation'
	    'doas: Privilege elavation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a6502d53a94a99da135e1212993802498dcde87cd3516e1e5a9dc942c1260bfb')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
