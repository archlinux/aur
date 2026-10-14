# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: arthurbpf <arthurbpfernandes@gmail.com>

pkgname=turso-cli
pkgver=1.0.34
pkgrel=1
pkgdesc="Command line interface to Turso."
arch=('x86_64')
url="https://github.com/tursodatabase/turso-cli"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tursodatabase/turso-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3ce72a76da92549aca05a8dcafd5f38056b71b85e537605bd09ed4aa19f43125')


build() {
	cd "$pkgname-$pkgver/cmd/turso"
	go build -o turso
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "cmd/turso/turso"
}
