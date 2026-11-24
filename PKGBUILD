# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cc-code-bin
pkgver=0.6.300
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
sha256sums_x86_64=('c35b70d007123f4a33def9007c9adff140909cf69b7a63e2243cf321ca05daf6')
sha256sums_aarch64=('5abf252db05c51b19e94977c7dabac572c01b40bbb88de29fa8acc83cd0a8b91')

package() {
  install -Dm755 "cc-code-linux-${CARCH}" "${pkgdir}/usr/bin/cc-code"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
