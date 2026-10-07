# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: arthurbpf <arthurbpfernandes@gmail.com>

pkgname=turso-cli
pkgver=1.0.33
pkgrel=1
pkgdesc="Command line interface to Turso."
arch=('x86_64')
url="https://github.com/tursodatabase/turso-cli"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tursodatabase/turso-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('95dee0bc2d0c39a4ed96ab8bdd939665823214cbb3182e2b58b2fb939f0d7ebc')


build() {
	cd "$pkgname-$pkgver/cmd/turso"
	go build -o turso
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "cmd/turso/turso"
}
