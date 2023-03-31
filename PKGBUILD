# Maintainer: atomicfs

pkgname=mdbook-admonish
pkgver=1.8.0
pkgrel=1
pkgdesc="A preprocessor for mdbook to add Material Design admonishments"
url="https://github.com/tommilligan/mdbook-admonish"
arch=(x86_64)
license=(MIT)
makedepends=(rust cargo)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3559dc6b7293cea16592b137863d93035aee6f08cdb5242dd294ddcad2389446')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

