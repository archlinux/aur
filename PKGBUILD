# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ttype-tui-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="Typing test for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/alirezaudev/ttype"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'ttype')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ttype_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ttype_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8f23dde63e06bc4c19280fe462ff7df6a76a2da57b2a0e7944f8ac62394e971a')
sha256sums_aarch64=('43da954108f99ef0130792f742a82f1d9840d57af0403a49c798639f70c2b87b')

package() {
  install -Dm755 "ttype" "${pkgdir}/usr/bin/ttype"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "completions/_ttype" "${pkgdir}/usr/share/zsh/site-functions/_ttype"
  install -Dm644 "completions/ttype.bash" "${pkgdir}/usr/share/bash-completion/completions/ttype"
  install -Dm644 "completions/ttype.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/ttype.fish"
  install -Dm644 "man/ttype.1" -t "${pkgdir}/usr/share/man/man1"
}
