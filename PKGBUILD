# Maintainer: JasonLandbridge
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/dcg

pkgname=dcg
pkgver=0.17.1 # renovate: datasource=github-releases depName=Dicklesworthstone/destructive_command_guard
pkgrel=1
pkgdesc="A hook that blocks destructive commands before AI coding agents run them"
arch=('x86_64')
url="https://github.com/Dicklesworthstone/destructive_command_guard"
license=('custom:MIT-with-OpenAI-Anthropic-Rider')
depends=('gcc-libs' 'glibc')
provides=('destructive-command-guard')
conflicts=('destructive-command-guard')
options=('!debug')
source=(
  "dcg-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/dcg-x86_64-unknown-linux-musl.tar.xz"
  "LICENSE::https://raw.githubusercontent.com/Dicklesworthstone/destructive_command_guard/v${pkgver}/LICENSE"
)
sha256sums=(
  '34ede837d5ef03df1fd98769718a6f6eaacaf6fca01d2455281567ccd2e1afde'
  '32a82e0a5754e72e51fae44b65a936c831c07376f21c90f5fb9e76897fcc3509'
)

package() {
  install -Dm755 "${srcdir}/dcg" "${pkgdir}/usr/bin/dcg"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
