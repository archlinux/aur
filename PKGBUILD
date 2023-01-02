# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=arch-update
pkgver=1.4.2
pkgrel=2
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
sha256sums=('e382adaa778e372dab4aa2bceb17b22a0e878b7cc11d0a7a7c71bf83f976560d')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
