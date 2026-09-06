# Maintainer: SHORiN <shorin@users.noreply.github.com>
#
# AUR `miyu` 包装包：下载 GitHub Release 上的预编译资产重新打包（避免让
# AUR 用户本地编译）。0.4.4 起字体（Noto CJK / Noto Emoji / JetBrains Mono）
# 已随 release 资产一并打包，不再从上游单独拉取。

pkgname=miyu
pkgver=0.5.0
pkgrel=2
pkgdesc='一个活在终端里的二次元少女。开箱即用的开源 AI 助手，支持接入通讯平台。'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('MIT' 'OFL-1.1')
options=('!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('chafa' 'gcc-libs' 'ripgrep' 'alsa-lib' 'onnxruntime')
optdepends=(
  'miyu-voice: voice wake word + speech recognition front end'
  'git: update default Shorin Wiki knowledge base'
  'fish: fish shell integration support'
  'bash: bash shell integration support'
  'zsh: zsh shell integration support'
  'python-playwright: 网页检索脚本(小红书/知乎/闲鱼/酒店比价)'
  'xorg-server-xvfb: 网页检索脚本后台运行所需的虚拟显示'
  'chromium: 网页检索脚本的浏览器(或改装 google-chrome)'
  'python-qrcode: 扫码登录时在终端里画二维码'
)
_release_pkgrel=2
source=(
  "${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.release.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.pkg.tar.zst"
)
sha256sums=(
  '0943349a9cc70675fb1bf4a197dd822f165ed9792e263bcca134003c069beb88'
)

package() {
  install -Dm755 "${srcdir}/usr/bin/miyu" "${pkgdir}/usr/bin/miyu"
  cp -a "${srcdir}/usr/share" "${pkgdir}/usr/"
}
