# Maintainer: Manuel Coenen <dev+aur@manuelsbrain.de>
pkgname=rfm
pkgver=1.2.0
pkgrel=1
pkgdesc="Command-line interface to perform file management on RepRapFirmware based devices."
arch=('any')
makedepends=('go')
url="https://github.com/wilriker/rfm"
license=('MIT')
provides=('rfm')
conflicts=('rfm')
source=("https://github.com/wilriker/rfm/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('9eeef7ed740313020566e311cf88cf00cc1b704b16295eb2f2fdea46c679905a')

build() {
	cd "${pkgname}-${pkgver}"
	go build -o rfm cmd/rfm/main.go
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 rfm "${pkgdir}/usr/bin/rfm"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
