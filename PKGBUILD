# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# All config files from (go2rtc)[https://aur.archlinux.org/packages/go2rtc]
# Thanks the maintainer of go2rtc for providing this package!
pkgname=go2rtc-bin
pkgver=1.9.14
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
sha256sums_aarch64=('359fabade8a7a51e81a55fe6df6b0ef81764a5e1d63179577534eaaa71904b50')
sha256sums_armv7h=('4d7e1639af5a2722a28e864468fd8099b3c1682565446c798bf9e3b38fde12e4')
sha256sums_i686=('12a114d19fc9fba1b3541cf7c6bb9b01896a6845f31285ec77269e2e7c613885')
sha256sums_x86_64=('32d616af226bd731678ffde328b94cfb94e30339bfefc469cfb76323144615a6')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-bin}.conf"
    install -Dm644 "${srcdir}/${pkgname%-bin}.tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
    install -Dm755 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/${pkgname%-bin}.yaml" -t "${pkgdir}/etc"
}
