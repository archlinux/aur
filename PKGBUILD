# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=1.5.4
pkgrel=1
pkgdesc="An update notifier/applier that assists you with important pre/post update tasks."
arch=('any')
url="https://github.com/Antiz96/arch-update"
license=('GPL3')
depends=('pacman-contrib' 'curl' 'htmlq' 'diffutils' 'vim')
optdepends=('yay: AUR support'
	    'paru: AUR support'
	    'libnotify: Desktop notification support'
	    'sudo: Privilege elevation'
	    'doas: Privilege elavation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('927379f7aee0e9c5ac4f4ba1788b95253f1d9e495e5b955894d35ca8d9678afe')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
