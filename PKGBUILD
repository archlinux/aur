# Maintainer: Sunny <sunny@sny.sh>

pkgname=nino
pkgver=0.2.1
pkgrel=3
pkgdesc="A terminal-based text editor inspired by Kilo"
arch=("x86_64")
url="https://evanl.in/${pkgname}-editor/"
license=("BSD-2-Clause")
depends=("glibc")
source=("https://github.com/evanlin96069/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("628b850ef47631ba1bff48a038700346de1e9a22d4bc082a5bccb57d287947d6")

build() {
	"${srcdir}/${pkgname}-${pkgver}/scripts/build.sh"
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
