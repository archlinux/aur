# Maintainer: 910JQK <v910JQK@gmail.com>
_pkgname=subway-launcher
pkgname=$_pkgname-git
pkgver=r33.fd12ae3
pkgrel=1
pkgdesc='An HTML5-based application launcher for GNU/Linux with MS-modern-like style.'
arch=('any')
url='https://github.com/SubwayDesktop/subway-launcher'
depends=('cubway' 'cubway-jslib-simplejs')
makedepends=('coreutils')
provides=('subway-launcher')
source=('subway-launcher::git+https://github.com/SubwayDesktop/subway-launcher.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m755 -d "${pkgdir}/opt/Subway/launcher"
	install -m644 back_arrow.svg launcher.js main.html style.css "${pkgdir}/opt/Subway/launcher/"
}
