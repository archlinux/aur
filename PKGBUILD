# Maintainer: Daniele Moser <dnlmsr0@gmail.com>
_pkgname=esp-idf-helper
pkgname="${_pkgname}-git"
pkgver=v2.0.1.r0.1064108
pkgrel=3
pkgdesc="Helper for installing various esp-idf versions"
arch=("x86_64")
url="https://gitlab.com/dnlmsr/${_pkgname}"
license=("GPL")
provides=("${pkgname%-git}" "esp-idf")
conflicts=("${pkgname%-git}")
depends=("git")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "${pkgdir}/usr/bin"
	cp ./src/esp-idf-helper "${pkgdir}/usr/bin"
}
