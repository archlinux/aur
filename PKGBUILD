# Maintainer: kpcyrd <git@rxv.cc>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=cargo-tree
pkgver=0.25.0
pkgrel=1
pkgdesc="Cargo subcommand that visualizes a crate's dependency graph in a tree-like format"
url="https://github.com/sfackler/cargo-tree"
depends=('curl')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sfackler/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('aac4c3529cd92b029df7dab21710adaca0270e5d09033bfb3d083fb663e7cd3e')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

# upstream doesn't have tests

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
