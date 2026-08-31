# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ipatool-bin
_pkgname=IPATool
pkgver=2.4.0
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
sha256sums_aarch64=('d1c435cfaa25f7d8e2402833d18a27738cd0fb257632c74ebdbfac519bf75b1e')
sha256sums_x86_64=('b3f17115d882e109fae461c67262134675fbdeacff93166c8e646ada0082bfc3')
package() {
    install -Dm755 "${srcdir}/bin/${pkgname%-bin}-${pkgver}-linux-"* "${pkgdir}/usr/bin/${pkgname%-bin}"
}
