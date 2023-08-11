# Maintainer: atomicfs

pkgname=mdbook-admonish
pkgver=1.10.2
pkgrel=1
pkgdesc="A preprocessor for mdbook to add Material Design admonishments"
url="https://github.com/tommilligan/mdbook-admonish"
arch=(x86_64)
license=(MIT)
makedepends=(rust cargo)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a1917516c72b17e97c424def3138f2390aeebbc67757b7448133277eec454393')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

