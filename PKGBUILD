# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>

pkgname=lucid
pkgver=0.3.0
pkgrel=1
pkgdesc='A simple mock-application for programs that work with child processes'
arch=('x86_64')
url="https://github.com/sharkdp/lucid"
license=('MIT' 'APACHE')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01ec59195307ebd921470803f1546785309661fc0fdc0957fd413d3de3cce457')

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --locked
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 target/release/lucid -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE-APACHE LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:

