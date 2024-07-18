# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=hoverfly-bin
pkgver=1.10.1
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
sha256sums_aarch64=('a4f84c32bf89c45dcab90dfaa160f79ba5da17190b11bf267c7880a59d10e98e')
sha256sums_i686=('7a2d6cf91b1323f712da6923c687f9687037e469ab302837872b8ae7a0381f43')
sha256sums_x86_64=('b48bb884ee00ec6fe2019ecb2c3c6a66d83d939d634d015171848805c21c8e4c')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/hoverctl" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}