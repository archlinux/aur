# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=portforwarder-rs
pkgver=0.1.0
pkgrel=1
pkgdesc='Forwards ports on UPnP-enabled gateways. Inspired by portmapper'
arch=('i686' 'x86_64')
url='https://crates.io/crates/portforwarder-rs'
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pzmarzly/portforwarder-rs/archive/${pkgver}.tar.gz")
sha256sums=('b5f43447a31628d4486e0856ebfe0ac140f63aae240254d1ed69539278edaf56')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D target/release/pf -t "${pkgdir}"/usr/bin
  install -Dm644 README.md -t "${pkgdir}"/usr/share/doc/portforwarder-rs
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/portforwarder-rs
}