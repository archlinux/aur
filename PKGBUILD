# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=2.0.0
pkgrel=1
pkgdesc="An update notifier/applier that assists you with important pre/post update tasks."
arch=('any')
url="https://github.com/Antiz96/arch-update"
license=('GPL-3.0-or-later')
depends=('bash' 'pacman-contrib' 'curl' 'htmlq' 'diffutils' 'hicolor-icon-theme' 'python' 'python-pyqt6' 'qt6-svg' 'glib2')
optdepends=('yay: AUR Packages support'
            'paru: AUR Packages support'
            'flatpak: Flatpak Packages support'
            'libnotify: Desktop notifications support on new available updates'
            'vim: Default merge program for pacdiff'
            'qt6-wayland: Systray applet support on Wayland'
            'sudo: Privilege elevation'
            'doas: Privilege elavation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('48b2b972a0227f197e7c856094102c61982061a00f6d69e7e2d77402294bb8b4')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
