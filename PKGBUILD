# Maintainer: Ashe Sterling <ashe.sterling@outlook.com>
pkgname=clrblk
pkgver=1.4.4
pkgrel=1
pkgdesc="A simple utility to show and test pretty (and not so pretty) colors in the terminal."
arch=('x86_64')
url="https://gitlab.com/ashe.sterling/clrblk"
license=('WTFPL-2-or-later')
depends=()
makedepends=('rustup' 'cargo')
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/ashe.sterling/clrblk/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('6e5605d294bb1de0bb7dbe263aea7023e358378a64412f4261760bb6fbf0053d')

build() {
  cd "$srcdir/${pkgname}-v${pkgver}"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-v${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
