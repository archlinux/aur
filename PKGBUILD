# Maintainer: ewen-lbh <hey@ewen.works>

pkgname=ortfo-bin
pkgver=0.1.0.alpha.2
pkgrel=1
pkgdesc="The GUI for ortfo, a portfolio manager (pre-built binary)"
arch=('x86_64')
url="https://github.com/ortfo/gui"
license=("GPL-3.0")
depends=("gtk3" "webkit2gtk")
makedepends=("curl")
conflicts=("ortfo" "ortfo-git")
provides=("ortfo")
source=("https://github.com/ortfo/gui/releases/download/v${pkgver/.alpha/-alpha}/ortfo-linux" "https://github.com/ortfo/gui/raw/v${pkgver/.alpha/-alpha}/LICENSE" "https://github.com/ortfo/gui/raw/v${pkgver/.alpha/-alpha}/README.md")
sha256sums=("SKIP" "SKIP" "SKIP")

pkgver() {
	git describe --tags --abbrev=0 | sed 's/-/./g'
}

package() {
	install -Dm 755 ortfo-linux -t "${pkgdir}/usr/bin"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
