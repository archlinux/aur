# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Tony Fettes <tonyfettes@tonyfettes.tk>
pkgname=tunasync-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Mirror job management tool developed by TUNA.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/tuna/tunasync"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-arm64-bin.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-amd64-bin.tar.gz")
sha256sums_aarch64=('bd47caca79d90ab7e75becd7978b8fd86399df2c7a750e6db8fbf5fd1d8481d2')
sha256sums_x86_64=('ab9f05b6dfd8bab24ea4515ce069743c0ce06d413a144a74b73a3d05eecfa081')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname%-bin}tl" -t "${pkgdir}/usr/bin"
}