# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: arthurbpf <arthurbpfernandes@gmail.com>

pkgname=turso-cli
pkgver=1.0.29
pkgrel=1
pkgdesc="Command line interface to Turso."
arch=('x86_64')
url="https://github.com/tursodatabase/turso-cli"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tursodatabase/turso-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bbf5bd1bee1c2fc6a7d8cf158d6ee1eefe77f889a398ab412f0710443f15147a')


build() {
	cd "$pkgname-$pkgver/cmd/turso"
	go build -o turso
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "cmd/turso/turso"
}
