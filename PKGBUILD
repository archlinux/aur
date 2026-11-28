# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gh-grep-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="Search repositories for a pattern using the GitHub API"
arch=('x86_64' 'aarch64')
url="https://github.com/k1LoW/gh-grep"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gh-grep_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gh-grep_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('637414bf865ff59a7fcd41737781dab8f787bd9d7dccb2763e5987edeb2b5485')
sha256sums_aarch64=('9b2668865ea42fc144edd6195ecb257468efa88a6f0b4dc48e47a165cabda89e')

package() {
  install -Dm755 "gh-grep" "${pkgdir}/usr/bin/gh-grep"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
