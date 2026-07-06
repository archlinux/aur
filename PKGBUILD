# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ipatool-bin
_pkgname=IPATool
pkgver=2.3.1
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
sha256sums_aarch64=('01239141e2654f3f5f08d00f5a31f6fd037b32b925c4d6c8f4433a5302e7f528')
sha256sums_x86_64=('9800eb2956c6be275f77337212a0075cdccbce45f39a74f478059e6eb0c52f5d')
package() {
    install -Dm755 "${srcdir}/bin/${pkgname%-bin}-${pkgver}-linux-"* "${pkgdir}/usr/bin/${pkgname%-bin}"
}
