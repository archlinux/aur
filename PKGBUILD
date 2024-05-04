# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=mdbook-graphviz
pkgver=0.2.0
pkgrel=1
pkgdesc="A preprocessor for mdbook to renders graphs using Graphviz"
url="https://github.com/dylanowen/mdbook-graphviz"
arch=('x86_64')
license=('MPL-2.0')
makedepends=(
  'cargo'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7a74d7a12bd2a0b7a119d0b14ca7e7d3840acb347debff9ec0ad4d4add026785')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

