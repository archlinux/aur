# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=cargo-tally
pkgver=1.0.14
pkgrel=1
pkgdesc="Graph the number of crates that depend on your crate over time"
url="https://github.com/dtolnay/cargo-tally"
depends=('cargo' 'curl' 'http-parser')
optdepends=('gnuplot: display graphs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dtolnay/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('d7f88ff2016252ac11f2426a9ed9f05d22ecba305f98e000ff7a7e9eb4055676180400fa8456549a3a201ebf7b7ccfbcd09175084f6b8ea6fc3c3a7a8f2a3890')

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
