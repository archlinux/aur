# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: arthurbpf <arthurbpfernandes@gmail.com>

pkgname=turso-cli
pkgver=1.0.18
pkgrel=1
pkgdesc="Command line interface to Turso."
arch=('x86_64')
url="https://github.com/tursodatabase/turso-cli"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tursodatabase/turso-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e23de287fb2d4eed3c3afb96e5107e1afb484610684699523b30d29aa46255da')


build() {
	cd "$pkgname-$pkgver/cmd/turso"
	go build -o turso
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "cmd/turso/turso"
}
