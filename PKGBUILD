# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=tetris-cli
pkgver=22.67.2
pkgrel=1
pkgdesc="A tetris game that runs in a terminal"
arch=('any')
url="https://www.github.com/blueOkiris/tetris-cli"
license=('GPL3')
makedepends=('git' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
conflict=("${pkgname}-bin" "${pkgname}-git")
sha256sums=('42d6ffefb220802c0006f92285068cfc3c14db1322ce938d1951248bbc95ffe4')

build() {
	cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
	cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

