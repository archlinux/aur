# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=hoverfly-bin
pkgver=1.9.2
pkgrel=1
pkgdesc="Lightweight service virtualization/API simulation tool for developers and testers"
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url='https://hoverfly.io'
_ghurl="https://github.com/SpectoLabs/hoverfly"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_arm64.zip")
source_i686=("${pkgname}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_386.zip")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_amd64.zip")
sha256sums_aarch64=('76dd1dfe3dcf66895b45c2660950daa4caa306ac4366a2f540d3844020936ad8')
sha256sums_i686=('45854c0e88a95fed4b45762a0266dd3c40bdbbf919f72636ff61d6e85ec26011')
sha256sums_x86_64=('69e50c298ce5818c4f7744210d50593942fe893ce2627b7688884e9e722fc672')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/hoverctl" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}