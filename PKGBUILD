# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# All config files from (go2rtc)[https://aur.archlinux.org/packages/go2rtc]
# Thanks the maintainer of go2rtc for providing this package!
pkgname=go2rtc-bin
pkgver=1.9.10
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
sha256sums_aarch64=('f4e3f56e991d5540c3c4790269044d864acbc3380f9896ef4fe1862c79c66367')
sha256sums_armv7h=('63389d8c81a462db213a3a2f2bdbd846fffac079904dd61c91f6adb6f153fd30')
sha256sums_i686=('95e49b839b427518834122c52a5fa622d520fd7ca62038463eb9764950868001')
sha256sums_x86_64=('825bffa9caf585a008bcdea6b354418263d94aea73674f1a5bcacfb26c2c35f9')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-bin}.conf"
    install -Dm644 "${srcdir}/${pkgname%-bin}.tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
    install -Dm755 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/${pkgname%-bin}.yaml" -t "${pkgdir}/etc"
}
