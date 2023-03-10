# Maintainer: Austin Horstman <khaneliman12@gmail.com>

_pkgbase="sddm-catppuccin"
pkgname="$_pkgbase-git"
pkgver=r33.7b7a86e
pkgrel=1
pkgdesc="Theme for SDDM with catppuccin backgrounds and styling."
arch=('any')
url="https://github.com/khaneliman/sddm-catppuccin"
license=('GPL3')
depends=('sddm' 'qt5-graphicaleffects' 'qt5-svg' 'qt5-quickcontrols2')
makedepends=('git')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
backup=('usr/share/sddm/themes/catppuccin/theme.conf')
source=('git+https://github.com/khaneliman/sddm-catppuccin')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/sddm-catppuccin"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/sddm-catppuccin"
	mkdir -p "${pkgdir}/usr/share/sddm/themes/"
	cp -r catppuccin/ "${pkgdir}/usr/share/sddm/themes/"
}
