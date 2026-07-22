# Maintainer: Sunny <sunny@sny.sh>

pkgname=nino
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal-based text editor inspired by Kilo"
arch=("any")
url="https://evanlin96069.github.io/nino-editor/"
license=("BSD-2-Clause")
depends=("glibc")
makedepends=("cmake" "git")
source=("git+https://github.com/evanlin96069/${pkgname}.git#tag=v${pkgver}")
sha256sums=("f259b47da3d7c7ec442f0b61994a76cc9d8632b138df729717b3e453bee7f61c")

build() {
	cmake -S "${pkgname}" -B "${pkgname}/build" -D "CMAKE_INSTALL_PREFIX=/usr"
	cmake --build "${pkgname}/build"
}

package() {
	DESTDIR="${pkgdir}" cmake --install "${pkgname}/build"
	install -Dm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
