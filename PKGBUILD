# Maintainer: zach <zach {at} zach-adams {dot} com>

pkgname=gtk-theme-phosphene-git
_pkgname=Phosphene
pkgver=17.11c82d5
pkgrel=1
pkgdesc="A flat theme for GNOME 3.10. Latest commit from Github."
arch=('any')
url="https://github.com/hdni/${_pkgname}"
license=('GPL3')
depends=('gtk3')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/hdni/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"
	find Phosphene* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
