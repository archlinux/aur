# Maintainer: Sunny <sunny@sny.sh>

pkgname=nino
pkgver=0.2.1
pkgrel=1
pkgdesc="A terminal-based text editor inspired by Kilo"
arch=("x86_64")
url="https://evanlin96069.github.io/nino-editor/"
license=("BSD-2-Clause")
depends=("glibc")
makedepends=("git")
source=("git+https://github.com/evanlin96069/${pkgname}.git#tag=v${pkgver}")
sha256sums=("8ac9fda2078b2a874841bcc02a71287a2e7a105589ba24c6bedb7dd5ece3efd3")

build() {
	"${pkgname}/scripts/build.sh"
}

package() {
	install -Dm755 "${pkgname}/build/nino" -t "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
