# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=forwarder-bin
pkgver=1.6.5
pkgrel=1
pkgdesc="Fast MITM proxy with PAC support"
arch=('x86_64' 'aarch64')
url="https://github.com/saucelabs/forwarder"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/forwarder-${pkgver}_linux.x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/forwarder-${pkgver}_linux.aarch64.tar.gz")
sha256sums_x86_64=('9383802e464bb2c4e4f4a204a861a15d3b66f0301ae25b105606cbb03ebe5ba6')
sha256sums_aarch64=('cbd8b1331f71c26d8b8941419e262da1cb212a9ca76c3133fefdf94571af526d')

package() {
  install -Dm755 "forwarder" "${pkgdir}/usr/bin/forwarder"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE.3RD_PARTY" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "completions/forwarder.bash" "${pkgdir}/usr/share/bash-completion/completions/forwarder"
  install -Dm644 "completions/forwarder.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/forwarder.fish"
  install -Dm644 "completions/forwarder.zsh" "${pkgdir}/usr/share/zsh/site-functions/_forwarder"
}
