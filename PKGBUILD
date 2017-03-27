# Maintainer: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-plano-git
_pkgname=plano-theme
_pkgauthor=lassekongo83
pkgver=140.f7dba06
pkgrel=2
pkgdesc="A flat theme for GNOME & Xfce4. Latest commit from the master branch on Github."
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('ttf-roboto')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/${_pkgauthor}/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	install -d $pkgdir/usr/share/themes

	mv "${srcdir}/${_pkgname}" "$pkgdir/usr/share/themes/Plano"
}
