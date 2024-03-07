# Maintainer: Jerdle <danielamdurer at gmail.com>
# Maintainer: Teteros <teteros at teknik dot io>


_pkgname=E17gtk-revolved
pkgname=gtk-theme-e17gtk-revolved-git
pkgver=2217140
pkgrel=1
pkgdesc="A dark GTK2/GTK3 theme with sharp corners, which is designed for use in Enlightenment and gives the elegant look of Enlightenment to GTK widgets - Revolved version."
arch=('any')
url="https://git.disroot.org/eudaimon/E17gtk-revolved.git"
license=('GPL')
optdepends=('enlightenment' 'qt5-styleplugins: GTK+ rendering for QT5')
makedepends=('git')
source=("git+https://git.disroot.org/eudaimon/${_pkgname}")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -d "${pkgdir}/usr/share/themes"
	cp -a "${_pkgname}" "${pkgdir}/usr/share/themes/${_pkgname}"
}
