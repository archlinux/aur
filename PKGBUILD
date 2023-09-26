# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Jouni Rinne <l33tmmx swirlything gmail dot com>

pkgname=solarized-colors-iconpack-git
pkgver=1.0.r112.g623ad87
pkgrel=1
pkgdesc="A set of solarized-colored icons"
arch=('any')
url="https://www.gnome-look.org/p/1309239/"
license=('GPL')
makedepends=('git')
source=("git+https://github.com/rtlewis88/rtl88-Themes.git#branch=Solarized-Colors-Iconpack")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
	cd ${srcdir}/rtl88-Themes
	git describe --abbrev=7 --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd ${srcdir}/rtl88-Themes
	mkdir -p ${pkgdir}/usr/share/doc/solarized-colors-iconpack
	cp README.md ${pkgdir}/usr/share/doc/solarized-colors-iconpack/
	mkdir -p ${pkgdir}/usr/share/icons
	cp -R Solarized* ${pkgdir}/usr/share/icons/
}
