# Maintainer: atomicfs

pkgname=mdbook-pagetoc
pkgver=0.1.8
pkgrel=1
pkgdesc="A preprocessor for mdbook to render a table of contents for each page"
url="https://github.com/slowsage/mdbook-pagetoc"
arch=(x86_64)
license=(MPL)
makedepends=(rust cargo)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('18af9255054f85039f168989236e3ee1985b60ef5fc377b2552ea0188c951b8e')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

