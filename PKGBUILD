# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=cargo-tally
pkgver=1.0.17
pkgrel=1
pkgdesc="Graph the number of crates that depend on your crate over time"
url="https://github.com/dtolnay/cargo-tally"
depends=('cargo' 'curl' 'http-parser')
optdepends=('gnuplot: display graphs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dtolnay/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ebea4bb21ad19271576051432183e5780ab62c75d826013dc4d1a22926509519941ad811b3446341612343ea0132afba104c5be504198cd9df19760b0befb1c4')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release 
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
