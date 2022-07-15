# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=tere
pkgver=1.1.0
pkgrel=1
pkgdesc="A terminal file explorer"
arch=(x86_64)
url=https://github.com/mgunyho/tere
license=("custom:EUPL")
makedepends=(rust)
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('a4ebd2f0b5728d6ec61749564106d67d74720fa05cb906686d559a5f15549698')

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
