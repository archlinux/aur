# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=rfm
pkgver=1.1.1
pkgrel=1
pkgdesc="Command-line interface to perform file management on RepRapFirmware based devices."
arch=('any')
makedepends=('go')
url="https://github.com/wilriker/rfm"
license=('MIT')
provides=('rfm')
conflicts=('rfm')
source=("https://github.com/wilriker/rfm/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('018eb0eae03f1efb1f94d029cabd3c287fda36d2c91b9433637d1a81d5a09cd2')

build() {
	cd "${pkgname}-${pkgver}"
	go build -o rfm cmd/rfm/main.go
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 rfm "${pkgdir}/usr/bin/rfm"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
