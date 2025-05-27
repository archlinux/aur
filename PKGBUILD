# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=fabio-bin
pkgver=1.6.6
pkgrel=1
pkgdesc='A fast, modern, zero-conf load balancing HTTP(S) and TCP router for deploying applications managed by consul.(Prebuilt version)'
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://fabiolb.net"
_ghurl="https://github.com/fabiolb/fabio"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_arm")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_386")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_amd64")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/fabiolb/fabio/v${pkgver}/LICENSE"
)
sha256sums=('013df56d9367ed7dbc6ce30d5318bceacdb1c8efcc96b5dfce740497eb499e93')
sha256sums_aarch64=('3ed87a120f8da3a281e3f9d261408fddc5711d61557593f34671792c7cfc4abf')
sha256sums_armv7h=('8292cc54d134145b52e92ac948e789956401ab6a61da7321967b4a3e30ec4faa')
sha256sums_i686=('5197cf0a60bb78a715dc14ebac78eacbf647c5bbcf3cef900044212dffad0442')
sha256sums_x86_64=('08b563fa309189047f3cfaa1e1baf3aca782121427d5ee0e9c80768887b56169')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
