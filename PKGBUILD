# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# All config files from (go2rtc)[https://aur.archlinux.org/packages/go2rtc]
# Thanks the maintainer of go2rtc for providing this package!
pkgname=go2rtc-bin
pkgver=1.9.11
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
sha256sums_aarch64=('81a8c4c6840c5ea4f9a05cf40d0d9cf30e67a821dc5fe2d1b037b9ecda6e7cae')
sha256sums_armv7h=('487e4c2efb677569b83781e0a2a9bbfeb580e0f31cf527d70ea454c869e93514')
sha256sums_i686=('e2e9cc552ebd620e8795c4695e4eb0eb0ecc8e89894e4d732f0788166ad2eb27')
sha256sums_x86_64=('5b28883d4552370bedfddde512f9f608c87f17886fe7e4d6bc81ee90089656e0')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-bin}.conf"
    install -Dm644 "${srcdir}/${pkgname%-bin}.tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
    install -Dm755 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/${pkgname%-bin}.yaml" -t "${pkgdir}/etc"
}
