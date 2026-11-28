# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=coddy-agent-bin
pkgver=1.4.52
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
sha256sums_x86_64=('5ce032fbf19a0632ce2e59fcee92c33f194057740a7092dc412467215b3329a2')
sha256sums_aarch64=('0ade507ce6c994a6e95bed9a9ea2eaa284a6eb6423849a9273af01277fc4c7f9')

package() {
  install -Dm755 "coddy" "${pkgdir}/usr/bin/coddy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "coddy.bash" "${pkgdir}/usr/share/bash-completion/completions/coddy"
  install -Dm644 "coddy.zsh" "${pkgdir}/usr/share/zsh/site-functions/_coddy"
  install -Dm644 "coddy.1" -t "${pkgdir}/usr/share/man/man1"
}
