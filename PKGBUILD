# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mockd-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="High-performance, multi-protocol mock server"
arch=('x86_64' 'aarch64')
url="https://github.com/getmockd/mockd"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mockd_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mockd_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fc4cd16bed6c4dc20d3f0a49d02badce78ed8018733567de75c5ef3cd92b57b7')
sha256sums_aarch64=('471e55391afa9e788e0ab4ca078563ac23168c836e4d0b76cc10e868e84d339c')

package() {
  install -Dm755 "mockd" "${pkgdir}/usr/bin/mockd"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "completions/mockd.bash" "${pkgdir}/usr/share/bash-completion/completions/mockd"
  install -Dm644 "completions/mockd.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/mockd.fish"
  install -Dm644 "completions/mockd.zsh" "${pkgdir}/usr/share/zsh/site-functions/_mockd"
}
