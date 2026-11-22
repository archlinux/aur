# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cc-code-bin
pkgver=0.6.298
pkgrel=1
pkgdesc="Fast, lightweight Claude Code alternative built in Rust with Ratatui TUI, ACP protocol support"
arch=('x86_64' 'aarch64')
url="https://github.com/cc-claws/cc-code"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_tag="npm-v${pkgver}"
_dl="${url}/releases/download/${_tag}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cc-claws/cc-code/${_tag}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cc-code-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cc-code-linux-aarch64.tar.gz")
sha256sums=('c408d05766b1622a522880f05e98f54feb738686113a9427ac7bdbf39c0b5144')
sha256sums_x86_64=('45d9165449170d61bc836f045aedb5b9a501f27ed064f13c591733b1424157be')
sha256sums_aarch64=('42b1444c2955c851b006e3b140b33fbff1fb5c3ff18cc71f630f6e67c7b06c69')

package() {
  install -Dm755 "cc-code-linux-x86_64" "${pkgdir}/usr/bin/cc-code"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
