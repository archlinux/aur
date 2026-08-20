# Maintainer: SHORiN <shorin@users.noreply.github.com>
#
# AUR `miyu` 包装包：下载 GitHub Release 上的预编译资产重新打包（避免让
# AUR 用户本地编译）。0.4.4 起字体（Noto CJK / Noto Emoji / JetBrains Mono）
# 已随 release 资产一并打包，不再从上游单独拉取。

pkgname=miyu
pkgver=0.4.4
pkgrel=1
pkgdesc='一个活在终端里的二次元少女。开箱即用的开源 AI 助手，支持接入通讯平台。'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('MIT' 'OFL-1.1')
options=('!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('chafa' 'gcc-libs' 'ripgrep' 'alsa-lib')
optdepends=(
  'git: update default Shorin Wiki knowledge base'
  'fish: fish shell integration support'
  'bash: bash shell integration support'
  'zsh: zsh shell integration support'
)
_release_pkgrel=1
source=(
  "${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.release.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.pkg.tar.zst"
)
sha256sums=(
  '1cdd12f558ab7bec6184e57baca4c2158e610482ea1cdc6f75b7b48e58702441'
)

package() {
  install -Dm755 "${srcdir}/usr/bin/miyu" "${pkgdir}/usr/bin/miyu"
  cp -a "${srcdir}/usr/share" "${pkgdir}/usr/"
}
