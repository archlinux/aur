# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-tally
pkgver=0.2.6
pkgrel=1
pkgdesc="Graph the number of crates that depend on your crate over time"
url="https://github.com/dtolnay/cargo-tally"
depends=('cargo' 'curl' 'http-parser')
optdepends=('gnuplot: display graphs')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dtolnay/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1576e939be2144400958d165405d2176f5a9160013aeb872fe16cb9bb17f67bb')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
