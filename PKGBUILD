# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Gustavo Castro <gustawho[at]gmail[dot]com>
# Submitter: acrox999 <acrox999[at]gmail[dot]com>

pkgname=gtk-theme-iris-dark-git
_pkgname=iris-dark
pkgver=107.3468e91
pkgrel=1
pkgdesc="A flat theme that uses varying shades and tones to create distinction and a modern experience."
arch=('any')
url="http://thevirtualdragon.deviantart.com/art/Iris-Dark-Gtk-Theme-v1-9-429628194"
license=('GPL3')
optdepends=("gtk-engine-murrine: gtk2 bindings"
	"gtk3: gtk3 bindings")
makedepends=('git')
provides=("gtk-theme-iris-dark=${pkgver}")
conflicts=('gtk-theme-iris-dark')
changelog="CHANGELOG"
source=(${_pkgname}::'git+https://github.com/xyl0n/iris.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -dm755 "${pkgdir}/usr/share/themes/${_pkgname}"
	cp -dpr --no-preserve=ownership . "${pkgdir}/usr/share/themes/${_pkgname}/"
	rm -rf "${pkgdir}/usr/share/themes/${_pkgname}/"{.git,CREDITS,LICENSE,README,README.md}
}
