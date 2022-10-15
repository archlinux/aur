# Maintainer: Evan McCarthy <evanmccarthy@outlook.com>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=tere
pkgver=1.3.0
pkgrel=1
pkgdesc="A terminal file explorer"
arch=(x86_64)
url=https://github.com/mgunyho/tere
license=("custom:EUPL")
makedepends=(rust)
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('000d597c731f7c69175c6c50ccb20a3f508122e678b46d9fd89736ff7f0ea60e')

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
