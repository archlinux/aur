# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=rfm
pkgver=1.1.0
pkgrel=2
pkgdesc="Command-line interface to perform file management on RepRapFirmware based devices."
arch=('any')
makedepends=('go')
url="https://github.com/wilriker/rfm"
license=('MIT')
provides=('rfm')
conflicts=('rfm')
source=("https://github.com/wilriker/rfm/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('f282d115ac41fedf1c7a76c81cc06a4a610d1617a925ac40d0401511cbea43fa')

build() {
	cd "${pkgname}-${pkgver}"
	go build -o rfm cmd/rfm/main.go
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 rfm "${pkgdir}/usr/bin/rfm"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
