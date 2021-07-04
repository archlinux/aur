#Maintainter: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=font8x8
pkgname=${_pkgname}-git
pkgver=r7.8e279d2
pkgrel=1
pkgdesc="8x8 monochrome bitmap fonts for rendering in c"
arch=('any')
url="https://github.com/dhepper/font8x8"
license=('Custom:CC0')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(git+https://github.com/dhepper/font8x8.git)
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"/"${_pkgname}"
	mkdir -p "${pkgdir}"/usr/include/${_pkgname}/
	mkdir -p "${pkgdir}"/usr/share/doc/${_pkgname}/
	install -Dm644 *.h "${pkgdir}"/usr/include/${_pkgname}/
	install -Dm644 *.c "${pkgdir}"/usr/include/${_pkgname}/
  install -Dm644 README "${pkgdir}"/usr/share/doc/${_pkgname}/
}
