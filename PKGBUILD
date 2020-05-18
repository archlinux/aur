# Maintainer: Martin Pugh <martin at parity dot io>
pkgname=polkadot
pkgdesc="Polkadot Node Implementation"
pkgrel=2
pkgver=0.7.33
arch=('x86_64')
url="https://github.com/paritytech/${pkgname}"
license=('GPL3')
makedepends=('rust' 'cargo')
source=("${pkgname}::git+https://github.com/paritytech/${pkgname}.git")
sha256sums=("SKIP")

build() {
	cd ${pkgname}
  git checkout "v${pkgver}"
	cargo build --release
}

package() {
	install -D -m755 "${srcdir}/${pkgname}/target/release/polkadot" "${pkgdir}/usr/bin/polkadot"
}
