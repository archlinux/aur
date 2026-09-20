# Maintainer: SHORiN <shorin@users.noreply.github.com>
#
# AUR `miyu-voice` 包装包：下载 GitHub Release 上由 packaging/arch/miyu-release
# 拆包产出的 miyu-voice 预编译资产重新打包。可选组件：装上它并在设置里开启
# 「语音功能」，daemon 就会拉起 `miyu-voice` 进程做唤醒词监听与本地识别。

pkgname=miyu-voice
pkgver=0.6.1
pkgrel=1
pkgdesc='Miyu 语音前端：唤醒词 + 本地语音识别(SenseVoice / sherpa-onnx)，可选组件'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/miyu-agent'
license=('MIT')
options=('!strip' '!debug')
export LC_ALL=C.UTF-8
_release_pkgrel=1
depends=("miyu=${pkgver}-${_release_pkgrel}" 'alsa-lib' 'bzip2' 'gcc-libs' 'glibc')
optdepends=('libnotify: desktop notifications when Miyu hears you')
source=(
  "${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.release.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.pkg.tar.zst"
)
sha256sums=(
  '6d68cec4ce3ed6a0bc3774b0386edcad9c36e88d8444fee2e8ab0a965101d01e'
)

# Keep the last published version and checksum until channel_update records
# the newly verified release asset. Never use SKIP for a binary release asset.
package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
