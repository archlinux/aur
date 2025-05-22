# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_appname=hover
pkgname="${_appname}fly-bin"
pkgver=1.11.1
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
sha256sums_aarch64=('65026d4d64e1dfc0b9da400609d4ff049b958d5596d565c5154048a50dffe68b')
sha256sums_i686=('70e272e01419ba2f2ab5c3a67951ac72b5a6623f03144b5647e4a30f27d8755b')
sha256sums_x86_64=('339b1e92d47759c9cb9b6ab41244b9a7322a70e5ef3c3ba6e287f7c68baad459')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_appname}ctl" -t "${pkgdir}/usr/bin"
}
