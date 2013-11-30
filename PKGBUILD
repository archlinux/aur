pkgname=('ascii-fluid-dynamics-git')
pkgver=12.9befe51
pkgrel=1
pkgdesc="Ascii Fluid Dynamics (21st IOCCC honorable mention)"
arch=('any')
url="http://www.ioccc.org/2012/endoh1/hint.html"
license=('Creative Commons')
makedepends=('git')
source=("${pkgname}::git+https://github.com/c00kiemon5ter/ioccc-obfuscated-c-contest.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "%s" "${ver//-/.}"
}

build() {
	cd "${srcdir}/${pkgname}/2012/endoh1"
	make endoh1
}

package() {
	local destdir="${pkgdir}/usr/lib/${pkgname}"
	install -D -m644 "${srcdir}/${pkgname}/2012/endoh1"/*.{txt,c} "${destdir}/"
	install -D -m755 "${srcdir}/${pkgname}/2012/endoh1/endoh1" "${destdir}/"
}
