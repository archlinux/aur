# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgbase=gtksourceview-theme-darcula2
pkgname=${_pkgbase}-git
pkgver=1.0.0.r0.gd255f3f
pkgrel=2
pkgdesc="Darcula2 GtkSourceView theme based on original Darcula theme by Sash0k"
arch=('any')
url="https://github.com/egormanga/${_pkgbase}"
license=('LGPL3')
optdepends=('gtksourceview3' 'gtksourceview4' 'gtksourceview5')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbase}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_pkgbase}"
	install -Dm644 'darcula2.xml' -t "${pkgdir}/usr/share/gtksourceview-3.0/styles"
	install -Dm644 'darcula2.xml' -t "${pkgdir}/usr/share/gtksourceview-4/styles"
	install -Dm644 'darcula2.xml' -t "${pkgdir}/usr/share/gtksourceview-5/styles"
}
