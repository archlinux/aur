# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=tetris-cli
pkgver=23.96.1
pkgrel=1
pkgdesc="A tetris game that runs in a terminal"
arch=('any')
url="https://www.github.com/blueOkiris/tetris-cli"
license=('GPL3')
makedepends=('git' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
conflict=("${pkgname}-bin" "${pkgname}-git")
sha256sums=('3f8da3ec0625e3906b1af7870daf55b189ae0b3c08aa15ebff535e3ef6c6be8c')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

