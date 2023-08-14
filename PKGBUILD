# Mantainer: arthurbpf <arthurbpfernandes@gmail.com>

pkgname=turso-cli
pkgver=0.80.0
pkgrel=1
pkgdesc="Command line interface to Turso."
arch=('x86_64')
url="https://github.com/tursodatabase/turso-cli"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tursodatabase/turso-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('272703b4b39c8cdfe6d3e3f71cfeb86e7bd2c5e3240e9108d3ee9a6d6855a5d5')


build() {
	cd "$pkgname-$pkgver"
	go install
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}
