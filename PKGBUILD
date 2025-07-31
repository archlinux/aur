# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_appname=hover
pkgname="${_appname}fly-bin"
pkgver=1.11.3
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
sha256sums_aarch64=('a8633465fac508a846d4722aa34d5d07aed7f8647ee0f26c83bf2698555a3028')
sha256sums_i686=('88e30e7fac390e9904b4cd10a27c6035285394a10e49caeb11414e8455e2fae0')
sha256sums_x86_64=('f74ffacd8ca8e91c355df51458f84de4364663acb1826aed77deec770944a243')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_appname}ctl" -t "${pkgdir}/usr/bin"
}
