# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_appname=hover
pkgname="${_appname}fly-bin"
pkgver=1.12.7
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
sha256sums_aarch64=('4662c9182e8eab3ed579f62d18697e1e75801cf8a92006e69306cdf2985f2333')
sha256sums_i686=('763e6fce0e7927909d47f700d05195b1e4b4dbc9c035721aadbbd3809d434603')
sha256sums_x86_64=('2071b0dbfad2a1dd8792e456b12ba40e3475b890a76d2ebbeb2a6bb3469ffeef')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_appname}ctl" -t "${pkgdir}/usr/bin"
}
