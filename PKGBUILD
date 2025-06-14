# Maintainer: Ashe Sterling <ashe.sterling@outlook.com>
pkgname=clrblk
pkgver=1.3.5
pkgrel=1
pkgdesc="A simple utility to show and test pretty (and not so pretty) colors in the terminal."
arch=('x86_64')
url="https://gitlab.com/ashe.sterling/clrblk"
license=('WTFPL-2-or-later')
depends=()
makedepends=('rust' 'cargo')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/ashe.sterling/clrblk/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('fede860a4b1b5529b773133fededdeb651ffc9ba27a0b0ef6be89da5b7d8d956')

build() {
  export RUSTUP_TOOLCHAIN=nightly
  cd "$srcdir/${pkgname}-v${pkgver}"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-v${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
