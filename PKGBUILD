# Maintainer: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-arc-flatabulous-git
_pkgname=arc-flatabulous-theme
_pkgauthor=andreisergiu98
pkgver=510.cf62cb0
pkgrel=1
pkgdesc="Arc-Flatabulous theme is the Arc theme with Flatabulous window controls. Latest commit from the master branch on Github."
arch=('any')
url="https://github.com/andreisergiu98/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/andreisergiu98/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh --prefix=/usr
}

package() {
	make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
