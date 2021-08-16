# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=rtsp-simple-server
pkgver=0.17.2
pkgrel=1
pkgdesc="Ready-to-use and zero-dependency RTSP / RTMP / HLS server and proxy."
arch=('x86_64')
url="https://github.com/aler9/rtsp-simple-server/"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
source_x86_64=(
    "https://github.com/aler9/${pkgname}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_amd64.tar.gz"
    "rtsp-simple-server.service"
)
sha256sums_x86_64=(
    'c2d2ff94eeea9098a5c18e8cf5d4747f06bd946599d3c7e2b5a2f5a25ceb22c0'
    'a6e8d22224fc76b28a7daeec4d0eb604224e136748ec760403ba1446a24f532f'
)

package() {
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.yml" "${pkgdir}/etc/${pkgname}/${pkgname}.yml"
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
