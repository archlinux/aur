# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chezit-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal UI for chezmoi dotfile management"
arch=('x86_64' 'aarch64')
url="https://github.com/daptify14/chezit"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/chezit_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/chezit_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6879e4c10ceac39b9d835649f28f859b33d1407146b5e3d58a33b23a72c6400f')
sha256sums_aarch64=('05333003c43110439a25423b1f0e83521ded93d4555c7e0d20b4d41403fa6c92')

package() {
  install -Dm755 "chezit" "${pkgdir}/usr/bin/chezit"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
