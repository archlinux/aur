# Maintainer: 910JQK <v910JQK@gmail.com>
_pkgname=cubway-jslib-simplejs
pkgname=$_pkgname-git
pkgver=r30.a081568
pkgrel=2
pkgdesc='Simple DOM operation library.'
arch=('any')
url='https://github.com/SubwayDesktop/simple.js/'
makedepends=('coreutils')
provides=('cubway-jslib-simplejs')
source=('cubway-jslib-simplejs::git+https://github.com/SubwayDesktop/simple.js.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m755 -d "${pkgdir}/opt/Subway/simple.js"
	install -m644 simple.js "${pkgdir}/opt/Subway/simple.js/"
}
