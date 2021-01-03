# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=color
pkgname=${_pkgname}-git
pkgver=2016cd4b
pkgrel=1
pkgdesc="Yet another C++ library that implements color"
arch=('x86_64')
url="https://github.com/dmilos/color"
license=('Apache')
depends=()
provides=("${_pkgname}")
conflicts=()
epoch=1
source=("${_pkgname}::git+https://github.com/dmilos/color.git")

sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "${pkgdir}/usr/include/"
	cp -r src/color/ "${pkgdir}/usr/include/"
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
