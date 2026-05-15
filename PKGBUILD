# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

_pkgname=calc
pkgname=coriolinus-${_pkgname}
pkgver=0.5.0
pkgrel=1
pkgdesc='Rust command line calculator'
url="https://github.com/coriolinus/${_pkgname}"
arch=('x86_64')
license=('GPL3')
makedepends=('rust')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('61cd9944c7dae9a05c5d5581299d1fbd18b9919100a59705a6ca7ac61d206953')

build() {
    cd "${_pkgname}-${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm 755 target/release/${_pkgname} -t ${pkgdir}/usr/bin
    install -Dm 644 README.md CHANGELOG.md -t ${pkgdir}/usr/share/doc/${pkgname}
}
