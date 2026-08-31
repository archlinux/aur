# Maintainer: galak9 <alterk@qq.com>
pkgname=qoder-cli-cn-bin
pkgver=1.1.38
pkgrel=1
pkgdesc="Qoder CLI (CN version) - An agentic AI coding tool built for command-line developers"
arch=('x86_64' 'aarch64')
url="https://qoder.com.cn"
license=('LicenseRef-Qoder-Product-Service')
depends=('glibc')
provides=("qoder-cli-cn=${pkgver}")
conflicts=('qoder-cli-cn')
options=('!strip' '!debug')

source_x86_64=(
  "qoderclicn-${pkgver}-linux-x64.tar.gz::https://static.qoder.com.cn/qoder-cli-cn/releases/${pkgver}/qoderclicn-linux-x64.tar.gz"
)
source_aarch64=(
  "qoderclicn-${pkgver}-linux-arm64.tar.gz::https://static.qoder.com.cn/qoder-cli-cn/releases/${pkgver}/qoderclicn-linux-arm64.tar.gz"
)

source+=(
  "LICENSE"
  "qoderclicn.bash"
  "qoderclicn.zsh"
  "qoderclicn.fish"
)

sha256sums=('b3c2f69ca7701015b1a7a2f7fa335aba917e7658129bee10fa96d066ba305bda'
            '563610c8624be209fa8353b8b64b6371532400dc43a4139895ec8dc445db7da1'
            '35b2db9d976fd8ac3ec609d0ac4d13c5f47598c25d7a299a16ddd4a2d430cf31'
            'acbcecde9ec8b3843b17f6a8b374babd62505bbc53277d50c2ec0399ec10809b')
sha256sums_x86_64=('c3a20e21a1bc673af86f5bc6e4e1f6998d3a345be903085188826472a6785ae6')
sha256sums_aarch64=('cd3eb90a39fad4bcfb0beb55226b77303d78516ac5878e71f3f44dd0c51874f1')

package() {
  install -Dm755 "${srcdir}/qoderclicn" "${pkgdir}/usr/bin/qoderclicn"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/qoderclicn.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/qoderclicn"
  install -Dm644 "${srcdir}/qoderclicn.zsh" \
    "${pkgdir}/usr/share/zsh/site-functions/_qoderclicn"
  install -Dm644 "${srcdir}/qoderclicn.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/qoderclicn.fish"
}
