# Maintainer: Sunny <sunny@sny.sh>

pkgname=nino
pkgver=0.2.0
pkgrel=2
pkgdesc="A terminal-based text editor inspired by Kilo"
arch=("x86_64")
url="https://evanlin96069.github.io/nino-editor/"
license=("BSD-2-Clause")
depends=("glibc")
makedepends=("git")
source=("git+https://github.com/evanlin96069/${pkgname}.git#tag=v${pkgver}")
sha256sums=("8aa7bdecfa100e2373f0f180d4776bb3f6295bc79c5b18552a3d6d042e0c73f3")

build() {
	"${pkgname}/scripts/build.sh"
}

package() {
	install -Dm755 "${pkgname}/build/nino" -t "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
