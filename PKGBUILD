# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=svgcleaner
pkgver=0.7.1
pkgrel=1
pkgdesc="An application that cleans svg images from unnecessary data in batch mode."
arch=('i686' 'x86_64')
url="https://github.com/RazrFalcon/SVGCleaner"
license=('GPL2')
makedepends=('gcc-libs' 'cargo')
source=("$pkgname-pkgver.tar.gz::https://github.com/RazrFalcon/SVGCleaner/archive/v${pkgver}.tar.gz")
sha256sums=('6f79cbe0776dcd00404b26951657ca59b66212de95103e9c68842bf7a8df1875')

build() {
  cd "${srcdir}/svgcleaner-${pkgver}/src/"
  cargo clean
  cargo build --release
}

package() {
  cd "${srcdir}/svgcleaner-${pkgver}/target/release"
  install -Dm755 "svgcleaner" "${pkgdir}/usr/bin/svgcleaner"
}
