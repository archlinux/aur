# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# All config files from (go2rtc)[https://aur.archlinux.org/packages/go2rtc]
# Thanks the maintainer of go2rtc for providing this package!
pkgname=go2rtc-bin
pkgver=1.9.13
pkgrel=1
pkgdesc="Ultimate camera streaming application with support RTSP, RTMP, HTTP-FLV, WebRTC, MSE, HLS, MP4, MJPEG, HomeKit, FFmpeg, etc.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://github.com/AlexxIT/go2rtc"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=()
options=(
    '!strip'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/AlexxIT/go2rtc/v${pkgver}/LICENSE"
    "${pkgname%-bin}.yaml"
    "${pkgname%-bin}.tmpfile.conf"
    "${pkgname%-bin}.service"
    "${pkgname%-bin}.sysusers.conf"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_i386")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64")
sha256sums=('b0dcf4855af5a72b4dfbd9117c207b330f4cc35658576a0b5351d6e2becac546'
            '0b23c4f5416494a31e4720693e5cc53bc8d15b04351a718e017f8bc0744e69a9'
            'f8caf9965af10be2ca90819898f9124966b69dcb3a477a9436e050cfb6bb5a29'
            'd1e19d906719b847456a11c430a77b4dd0ec73414e60e629df76be65bc372a10'
            '8e6c994be0a3fc65d909d23ead70dbc2b32c8747cc96bb1f5c2a83e93f16f7f5')
sha256sums_aarch64=('d9611321592bbb5997df9c7676f3a46b0ba3d7dd04ef5a994e84101100bd85c9')
sha256sums_armv7h=('7eb4a67caa1f9098344e79443a879a64cfe9f4d47f804763090170316026f4fa')
sha256sums_i686=('42204a1a1ccb9ddb7d5d617edbfda97f11c245722cc05f1e190e3d631821425d')
sha256sums_x86_64=('dce491325c28890ad0b85e83090753dc111b903ef83f43b834798f9114520dba')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-bin}.conf"
    install -Dm644 "${srcdir}/${pkgname%-bin}.tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
    install -Dm755 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/${pkgname%-bin}.yaml" -t "${pkgdir}/etc"
}
