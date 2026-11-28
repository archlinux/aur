# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=terminal-space-program-bin
pkgver=0.70.0
pkgrel=1
pkgdesc="Terminal orbital-mechanics rocket simulator"
arch=('x86_64' 'aarch64')
url="https://github.com/jasonfen/terminal-space-program"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/terminal-space-program-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/terminal-space-program-linux-arm64.tar.gz")
sha256sums_x86_64=('1eeb5e6438cfab5627d8842539fc8a0ca7f04aa79142238fe9b6178eeac434ed')
sha256sums_aarch64=('903eee7b3e9b8c6907e0e36861ae264092f799ad79f82be87cc14f3bb3cad461')

package() {
  install -Dm755 "terminal-space-program" "${pkgdir}/usr/bin/terminal-space-program"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
