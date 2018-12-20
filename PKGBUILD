# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-vendor
pkgver=0.1.22
pkgrel=1
pkgdesc="Cargo subcommand to vendor crates.io dependencies"
url="https://github.com/alexcrichton/cargo-vendor"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/alexcrichton/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9eeb11cdf7c8cd0e29ada7c6069f2cb33b4453a8baf1943c57d639f13eded61d5fc81c785c2b96d674c6bfb049f8d11a22f89afff36b6eff10a6e009ef2924ef')

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
