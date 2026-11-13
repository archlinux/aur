# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ipatool-bin
_pkgname=IPATool
pkgver=2.8.1
pkgrel=1
pkgdesc="Command-line tool that allows you to search for iOS, iPadOS, tvOS, visionOS, and macOS apps on the App Store, and download .ipa or macOS .pkg app packages."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/majd/ipatool"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/majd/ipatool/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")
sha256sums=('3466fcf0483597283e184031a9f1f0d142d7f41004452cf7714182742a503a95')
sha256sums_aarch64=('64dc6311acbd92f8165fe382ee86852f520b23355dae65933cb0f60177357116')
sha256sums_x86_64=('c5a7d35d98a0ac41fbb9d21c19437c3e6006c6e32556f484d09ed26872f9c283')
package() {
    install -Dm755 "${srcdir}/bin/${pkgname%-bin}-${pkgver}-linux-"* "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
