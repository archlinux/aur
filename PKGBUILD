# Maintainer: Michael Yugcha <mgyugcha@gmail.com>

pkgname=gnome-shell-copernico-theme-git
_pkgname=copernico-theme
pkgver=v3.26.r0.gb62fc37
pkgrel=1
pkgdesc="A Flat theme for the GNOME Shell which provides a slightly more pleasant visual impression."
arch=('any')
url="https://gitlab.com/mgyugcha/copernico-theme"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-copernico-theme')
conflicts=('gnome-shell-copernico-theme')
source=(${_pkgname}::'git+https://gitlab.com/mgyugcha/copernico-theme.git')
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -dm755 "${pkgdir}/usr/share/themes/${_pkgname}"
	cp -dpr --no-preserve=ownership ./gnome-shell "${pkgdir}/usr/share/themes/${_pkgname}/"
}
