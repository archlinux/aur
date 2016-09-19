# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=svgcleaner
pkgver=0.6.90
pkgrel=3
pkgdesc="An application that cleans svg images from unnecessary data in batch mode."
arch=("i686" "x86_64")
url="https://github.com/RazrFalcon/SVGCleaner"
license=("GPL3")
makedepends=('gcc-libs' 'cargo')
depends=('cargo')
source=("svgcleaner.install"
	"https://github.com/RazrFalcon/SVGCleaner/archive/v${pkgver}.tar.gz")
sha512sums=('938b5a1ab4a90512f1d25190cb4c246ee565aca841b8172fa93da81b0820d69c1598593ffcf44fee9c4be5f153e90f89ff09a32ad95a28eff16ed1b623b459a0'
            '986001e9e75645d61e3ee5fe9df9ebe67500b9dd54e5355992cb2cfa5ad5780f6724dea258a1149e3030ddd40d93787a96e7362d7bab6241484275c9e6460c7b')
install="svgcleaner.install"

build() {
  cd "${srcdir}/svgcleaner-${pkgver}/src/"
  cargo clean
  cargo build --release
}

package() {
  cd "${srcdir}/svgcleaner-${pkgver}/target/release"
  install -Dm755 "svgcleaner" "${pkgdir}/usr/bin/svgcleaner"
}
