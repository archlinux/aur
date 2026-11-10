# Maintainer: Sheyiyuan <sheyiyuantan90@qq.com>
pkgname=zero-beat-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Terminal music player for NetEase Cloud Music and Bilibili (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Sheyiyuan/zero-beat"
license=('AGPL-3.0-only')
depends=('ffmpeg' 'alsa-lib' 'libpulse')
provides=('zero-beat')
conflicts=('zero-beat' 'zero-beat-git')
options=('!strip' '!debug')
source_x86_64=("zero_${pkgver}_linux_amd64.tar.gz::${url}/releases/download/v${pkgver}/zero_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("zero_${pkgver}_linux_arm64.tar.gz::${url}/releases/download/v${pkgver}/zero_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('917bd0e740cf2d043d95c4dfc0f75f55c83a55ab6066ea05247868d5d7279090')
sha256sums_aarch64=('5c1d6c43f58a65e00b4f805199af1916a77f12681b9acc80f43a0166c2f1550d')

package() {
  install -Dm755 "${srcdir}/zero" "${pkgdir}/usr/bin/zero"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "${srcdir}/README.md" "${srcdir}/THIRD_PARTY_NOTICES.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/"
}
