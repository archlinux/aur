# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=gnome-shell-theme-copernico-git
_pkgname=copernico
pkgver=15.73fa7ca
pkgrel=1
pkgdesc="A theme for the GNOME Shell which provides a slightly more pleasant visual impression."
arch=('any')
url="http://gnome-look.org/content/show.php/Copernico+Theme?content=167439"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-theme-copernico')
conflicts=('gnome-shell-theme-copernico')
source=(${_pkgname}::'git+https://github.com/mgyugcha/copernico-theme.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -dm755 "${pkgdir}/usr/share/themes/${_pkgname}"
	cp -dpr --no-preserve=ownership ./gnome-shell "${pkgdir}/usr/share/themes/${_pkgname}/"
}
