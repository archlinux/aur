# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=svgcleaner
pkgver=0.8.0
pkgrel=1
pkgdesc="An application that cleans svg images from unnecessary data in batch mode."
arch=('i686' 'x86_64')
url="https://github.com/RazrFalcon/SVGCleaner"
license=('GPL2')
makedepends=('gcc-libs' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RazrFalcon/SVGCleaner/archive/v${pkgver}.tar.gz")
sha256sums=('ab3eb89e8edcf98414809535c5f0e6ad2fb95b51ab074e579b9751075bad9810')

build() {
  cd "${srcdir}/svgcleaner-${pkgver}/src/"
  cargo clean
  cargo build --release
}

package() {
  cd "${srcdir}/svgcleaner-${pkgver}/target/release"
  install -Dm755 "svgcleaner" "${pkgdir}/usr/bin/svgcleaner"
}
