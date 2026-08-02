# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: arthurbpf <arthurbpfernandes@gmail.com>

pkgname=turso-cli
pkgver=1.0.31
pkgrel=1
pkgdesc="Command line interface to Turso."
arch=('x86_64')
url="https://github.com/tursodatabase/turso-cli"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tursodatabase/turso-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e784a1591dd422106f9fa1b51d0c0050243971de09198fb59c6a0d9c73b20c82')


build() {
	cd "$pkgname-$pkgver/cmd/turso"
	go build -o turso
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "cmd/turso/turso"
}
