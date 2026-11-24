# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tmuxwatch-bin
pkgver=0.10.3
pkgrel=1
pkgdesc="TUI to watch tmux sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/steipete/tmuxwatch"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tmuxwatch_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tmuxwatch_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1b4e5f1475ab39256c114653dd260e14cde831c75498de51fbdb7aeb315d394c')
sha256sums_aarch64=('e0d15805b4ef300cdee33b9fd4c1c6e10848adc4362b2d1da725dbead2b45422')

package() {
  install -Dm755 "./tmuxwatch" "${pkgdir}/usr/bin/tmuxwatch"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
