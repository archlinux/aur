# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Paul Nicholson <brenix@gmail.com>
pkgname=yor-bin
pkgver=0.1.190
pkgrel=1
pkgdesc="Extensible auto-tagger for your IaC files. The ultimate way to link entities in the cloud back to the codified resource which created it."
arch=(
    'armv7h'
    'aarch64'
    'i686'
    'x86_64'
)
url="https://www.yor.io/"
_ghurl="https://github.com/bridgecrewio/yor"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glibc'
)
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_armv7h=('fcca87f78e7175e2f872f4efc2f6af60f604fb56241bf597a5a58fc899a85a5d')
sha256sums_aarch64=('9c0276eed29fe05c0b3ad1be65eb60d010d95be92c84aaa4632b68977cf292a3')
sha256sums_i686=('39925b4df0dc7fc205c7f35beae195f0715a1413d3e29a61489b93a7c18acdf9')
sha256sums_x86_64=('7f1ab55bc60bb478906e760ffb19354aa595f29c23a4341466f7f53979b64b34')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}