# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ipatool-bin
_pkgname=IPATool
pkgver=2.2.0
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
sha256sums_aarch64=('67368d7bc35c8f9cfe03bcd4cb35d3e5c72f6a140215c514eb72b5ee0fd958a6')
sha256sums_x86_64=('d268b8dcaadda7d37be110c42dc90f3a0435767339c4ed4b7b9110ec01df5631')
package() {
    install -Dm755 "${srcdir}/bin/${pkgname%-bin}-${pkgver}-linux-"* "${pkgdir}/usr/bin/${pkgname%-bin}"
}