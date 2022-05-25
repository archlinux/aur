# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=cargo-tally
pkgver=1.0.5
pkgrel=1
pkgdesc="Graph the number of crates that depend on your crate over time"
url="https://github.com/dtolnay/cargo-tally"
depends=('cargo' 'curl' 'http-parser')
optdepends=('gnuplot: display graphs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dtolnay/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('be1491d35ba1293b075ca15f16009b058d50a001ca04438e9826824dd7a8263d50ffd4d480c87d38adb8aac5c6e50748af675cd9e059c5355fd25392a409e3bf')

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
