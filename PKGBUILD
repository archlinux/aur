# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ipatool-bin
_pkgname=IPATool
pkgver=2.5.0
pkgrel=1
pkgdesc="Command-line tool that allows searching and downloading app packages (known as ipa files) from the iOS App Store.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/majd/ipatool"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")
sha256sums_aarch64=('799a7ac4e5de9f7a4e9348cb5e4d6415b1c782ed83f9212e0690a6f037f87c6d')
sha256sums_x86_64=('f1659ecda491997628f41e817e6d6fafe67e7f951414659912b55a7e64bf427c')
package() {
    install -Dm755 "${srcdir}/bin/${pkgname%-bin}-${pkgver}-linux-"* "${pkgdir}/usr/bin/${pkgname%-bin}"
}
