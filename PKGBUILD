# Maintainer: atomicfs

pkgname=mdbook-pagetoc
pkgver=0.1.7
pkgrel=1
pkgdesc="A preprocessor for mdbook to render a table of contents for each page"
url="https://github.com/slowsage/mdbook-pagetoc"
arch=(x86_64)
license=(MPL)
makedepends=(rust cargo)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3b1fd29a64d2d06ee436e9a02cea3fe18425ec71e703cc011a5d8de022f303f0')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

