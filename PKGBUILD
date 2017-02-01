# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=svgcleaner
pkgver=0.8.1
pkgrel=1
pkgdesc="An application that cleans svg images from unnecessary data in batch mode."
arch=('i686' 'x86_64')
url="https://github.com/RazrFalcon/SVGCleaner"
license=('GPL2')
makedepends=('gcc-libs' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RazrFalcon/SVGCleaner/archive/v${pkgver}.tar.gz")
sha256sums=('843abc42a012cd65cf680473657e2d3c0f30415c80b8e6edb86a0c5589b3db06')

build() {
  cd "${srcdir}/svgcleaner-${pkgver}/src/"
  cargo clean
  cargo build --release
}

package() {
  cd "${srcdir}/svgcleaner-${pkgver}/target/release"
  install -Dm755 "svgcleaner" "${pkgdir}/usr/bin/svgcleaner"
}
