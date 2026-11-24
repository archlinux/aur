# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazyflakes-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="TUI for searching nixpkgs stable and unstable side by side"
arch=('x86_64' 'aarch64')
url="https://github.com/majda-sh/lazyflakes"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lazyflakes_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lazyflakes_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0e44741fe3c7d6981d88d54e9a84a672b76d94779280ea681a669091369107c7')
sha256sums_aarch64=('b444ce3580243950061c86fceeb9910415a73c0003612166fdd80279495f8e4c')

package() {
  install -Dm755 "lazyflakes" "${pkgdir}/usr/bin/lazyflakes"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
