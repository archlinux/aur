# Maintainer: SHORiN <shorin@users.noreply.github.com>
#
# AUR `miyu-voice` 包装包：下载 GitHub Release 上由 packaging/arch/miyu-release
# 拆包产出的 miyu-voice 预编译资产重新打包。可选组件：装上它并在设置里开启
# 「语音功能」，daemon 就会拉起 `miyu-voice` 进程做唤醒词监听与本地识别。

pkgname=miyu-voice
pkgver=0.5.0
pkgrel=2
pkgdesc='Miyu 语音前端：唤醒词 + 本地语音识别(SenseVoice / sherpa-onnx)，可选组件'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('MIT')
options=('!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('miyu' 'alsa-lib' 'gcc-libs' 'glibc')
optdepends=('libnotify: desktop notifications when Miyu hears you')
_release_pkgrel=2
source=(
  "${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.release.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${_release_pkgrel}-${CARCH}.pkg.tar.zst"
)
sha256sums=(
  '93f903d245c11c094fde35edd9ded86837f7923b295dbd3277122c1ea134a57f'
)

package() {
  install -Dm755 "${srcdir}/usr/bin/miyu-voice" "${pkgdir}/usr/bin/miyu-voice"
  install -Dm644 "${srcdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
