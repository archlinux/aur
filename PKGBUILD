# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=coddy-agent-bin
pkgver=1.4.45
pkgrel=1
pkgdesc="General-purpose agent with a console TUI and an ACP server"
arch=('x86_64' 'aarch64')
url="https://github.com/coddy-project/coddy-agent"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/coddy-project/coddy-agent/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/coddy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/coddy_${pkgver}_linux_arm64.tar.gz")
sha256sums=('c3e1be9b60cb2797323867b2cc7edd00d68ed96acc0efd6e82138b9af73cccfd')
sha256sums_x86_64=('5757fe1a2894a951052025e61058ad457ff168d05c6b7bd35c6cdc398c44895a')
sha256sums_aarch64=('c02460e032585e05567bbd374b4ecddd8fc16e28c9d3f27fd16fc34649523e26')

package() {
  install -Dm755 "coddy" "${pkgdir}/usr/bin/coddy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "coddy.bash" "${pkgdir}/usr/share/bash-completion/completions/coddy"
  install -Dm644 "coddy.zsh" "${pkgdir}/usr/share/zsh/site-functions/_coddy"
  install -Dm644 "coddy.1" -t "${pkgdir}/usr/share/man/man1"
}
