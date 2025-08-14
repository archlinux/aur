# Maintainer: prime-run <prime0run@gmail.com>
pkgname=hydectl-bin
_pkgname=hydectl

pkgver=25.7.4
pkgrel=1

pkgdesc="a CLI tool for managing HyDE configurations and scripts."
arch=('x86_64')
url="https://github.com/HyDE-Project/hydectl"
license=('GPL-3.0')
depends=("hyprland")
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('18bbb8b22424811a69658a30cbfd95bd0b12311697bfc70a11d24da335e2468f')

pkgver() {
	curl -s "https://api.github.com/repos/HyDE-Project/hydectl/releases/latest" | grep -oP '"tag_name": "\K[^"]+' | sed 's/v//'
}

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
