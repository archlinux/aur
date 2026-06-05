# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=tetris-cli
pkgver=26.61.1
pkgrel=1
pkgdesc="A tetris game that runs in a terminal"
arch=('any')
url="https://www.github.com/blueOkiris/tetris-cli"
license=('GPL3')
makedepends=('git' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
conflict=("${pkgname}-bin" "${pkgname}-git")
sha256sums=('342b447ef28ff4c5f9bfdd286cdfad692ddd883ac97e3a8e0cfdc588d56e38b7')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

