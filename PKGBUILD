# Maintainer: zach <zach {at} zach-adams {dot} com>

pkgname=gnome-shell-extension-bottompanel-git
_pkgname=gnome-shell-extension-bottompanel
_pkgauthor=Thoma5
pkgver=27.fa9d21c
pkgrel=1
pkgdesc="Move your GNOME 3.16+ shell panel to the bottom."
arch=('any')
url="https://github.com/horst3180/${_pkgname}"
license=('GPL3')
depends=('gnome-shell>=3.16')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/${_pkgauthor}/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
	cp -r "$_pkgname" "${pkgdir}/usr/share/gnome-shell/extensions/bottompanel@tmoer93"
}
