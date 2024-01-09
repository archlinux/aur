# Maintainer: atomicfs

pkgname=mdbook-admonish
pkgver=1.15.0
pkgrel=1
pkgdesc="A preprocessor for mdbook to add Material Design admonishments"
url="https://github.com/tommilligan/mdbook-admonish"
arch=(x86_64)
license=(MIT)
makedepends=(rust cargo)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('09738830ce17ac450bce3007def5e79da58fc19b61c37cbc83a64a2aa4b02201')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

