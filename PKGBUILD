# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=cargo-tally
pkgver=1.0.12
pkgrel=1
pkgdesc="Graph the number of crates that depend on your crate over time"
url="https://github.com/dtolnay/cargo-tally"
depends=('cargo' 'curl' 'http-parser')
optdepends=('gnuplot: display graphs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dtolnay/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('5aff0ea005b71194f69f096024d83bd5bc19b3d904b797bc276d037ef653092f7b02bdd9b0b423b1e39f8e2904864a0504c558c2afd40c10348c6db1cd719972')

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
