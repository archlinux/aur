# Maintainer: atomicfs

pkgname=mdbook-graphviz
pkgver=0.1.7
pkgrel=1
pkgdesc="A preprocessor for mdbook to renders graphs using Graphviz"
url="https://github.com/dylanowen/mdbook-graphviz"
arch=(x86_64)
license=(MPL)
makedepends=(rust cargo)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('eab1204556b55d2dd845fdf7d03525204c8bcdb69cf93e5649b491895d485198')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

