# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_appname=hover
pkgname="${_appname}fly-bin"
pkgver=1.12.14
pkgrel=1
pkgdesc="Lightweight service virtualization/API simulation tool for developers and testers."
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
sha256sums_aarch64=('090e0e5281ab36818e96fec34b5c044cc45d2d8e8f06b9660a1cd33a0a80ca35')
sha256sums_i686=('c76ae250f17a333d2ee7c6e30fa4eb4bf0b9ed7a7d75fa1f3ca7ae70f4a32c90')
sha256sums_x86_64=('7bf9f0d0cfc2b7ebfde168f6081c7a701d0f80159be9e72ef5b68762e611c02d')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_appname}ctl" -t "${pkgdir}/usr/bin"
}
