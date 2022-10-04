# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=tere
pkgver=1.2.0
pkgrel=1
pkgdesc="A terminal file explorer"
arch=(x86_64)
url=https://github.com/mgunyho/tere
license=("custom:EUPL")
makedepends=(rust)
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('cb332750a1f1ea9f7de442559d6ccde46ad2ee0b954852866e23557aa38dc63b')

build() {
	cd ${pkgname}-${pkgver}

	cargo build --release --locked
}

package() {
	cd ${pkgname}-${pkgver}

	install -Dt "${pkgdir}"/usr/bin -m0755 target/release/${pkgname}
	install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m0644 LICENSE
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 README.md
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname}/demo -m0644 demo/*
}
