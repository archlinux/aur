# Maintainer: atomicfs

pkgname=mdbook-template
pkgver=1.1.0
pkgrel=1
pkgdesc="A preprocessor for mdbook to use template files with dynamic arguments"
url="https://github.com/sgoudham/mdbook-template"
arch=(x86_64)
license=(MIT)
makedepends=(rust cargo)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1f961da5e07f00179b552c68617880952e6120dd1c4e2ccdf89ad7769d315bb5')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

