# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_appname=hover
pkgname="${_appname}fly-bin"
pkgver=1.12.1
pkgrel=1
pkgdesc="Lightweight service virtualization/API simulation tool for developers and testers.(Prebuilt version)"
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
sha256sums_aarch64=('22174fe887aae1a27b807db81c404e28b354cdbcba64263ab0006739dea1d9db')
sha256sums_i686=('483aef1d980dd78f2e89dfbef8bc10c459b5c2e06613a204712ffa907a94cc76')
sha256sums_x86_64=('364df6881a1bc65a85b73d8412b31e4f72e096c739b51c33e98963b08470cd2a')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_appname}ctl" -t "${pkgdir}/usr/bin"
}
