# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cronn-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="Cron service with extras"
arch=('x86_64' 'aarch64')
url="https://github.com/umputun/cronn"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cronn_v${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cronn_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0d9dbf20db32feec7ef79ba6db0b6d9fa16953ea301637c179d19529a25fd4e5')
sha256sums_aarch64=('ecbf0741e4a4e9047236ad4f00d6d976b935733ec3c997441dae2e9e43d2156d')

package() {
  install -Dm755 "cronn" "${pkgdir}/usr/bin/cronn"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "completions/cronn.bash" "${pkgdir}/usr/share/bash-completion/completions/cronn"
  install -Dm644 "completions/cronn.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/cronn.fish"
  install -Dm644 "completions/cronn.zsh" "${pkgdir}/usr/share/zsh/site-functions/_cronn"
}
