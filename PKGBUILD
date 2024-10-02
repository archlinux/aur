# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=3.2.1
pkgrel=1
pkgdesc="An update notifier & applier that assists you with important pre / post update tasks."
url="https://github.com/Antiz96/arch-update"
arch=('any')
license=('GPL-3.0-or-later')
depends=('bash' 'pacman-contrib' 'archlinux-contrib' 'curl' 'fakeroot' 'htmlq' 'diffutils' 'hicolor-icon-theme' 'python' 'python-pyqt6' 'qt6-svg' 'glib2')
checkdepends=('bats')
optdepends=('yay: AUR Packages support'
            'paru: AUR Packages support'
            'flatpak: Flatpak Packages support'
            'libnotify: Desktop notifications support on new available updates'
            'vim: Default merge program for pacdiff'
            'qt6-wayland: Systray applet support on Wayland'
            'sudo: Privilege elevation'
            'doas: Privilege elavation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('978e207ea29ee3cb2cdf097eec90f459d4f3fa141b86e188ba5f73da3ae8bb90')

check() {
	cd "${pkgname}-${pkgver}"
	make test
}

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
