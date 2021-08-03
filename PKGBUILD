# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# NOTE: This package is officially named "spark", however that name
# conflicts with the Spark IM client. It is here renamed sparklines.

_pkgname=spark
pkgname=sparklines-git
pkgver=v1.0.1.33.gab88ac6
pkgrel=1
pkgdesc="Spark: Sparklines for your shell"
arch=("any")
url="https://zachholman.com/spark/"
license=("MIT")
makedepends=("git")
provides=("sparklines")
conflicts=("sparklines")
source=("git+https://github.com/holman/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --always | sed "s/-/./g"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
