# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=cargo-tally
pkgver=1.0.9
pkgrel=1
pkgdesc="Graph the number of crates that depend on your crate over time"
url="https://github.com/dtolnay/cargo-tally"
depends=('cargo' 'curl' 'http-parser')
optdepends=('gnuplot: display graphs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dtolnay/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1bc48af413cd59bd13f3ee5b13a0babf37cb50930d22fefca4ab5806c7cce33fca6c3fbefd40322d8db5beee5f75f13afc6d6ca1e71943d23a462fed25073345')

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
