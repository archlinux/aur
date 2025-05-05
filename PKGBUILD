# Maintainer: Texas0295 <texas0295@outlook.com>
pkgname=biblequote
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple program to print random bible verses."
arch=('any')
url="https://github.com/Texas0295/biblequote"
license=('MIT')
depends=()
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Texas0295/biblequote/archive/refs/tags/v0.1.0.tar.gz")
sha256sums=('0d9f022de0a75b5ded9f07b3bd9e224ffb15b8f6fbc4ee7ab2458ace93b7bdbe')
options=('!strip')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}/target/release"
  install -Dm755 "biblequote" "${pkgdir}/usr/bin/biblequote"
  cd "../.."
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
