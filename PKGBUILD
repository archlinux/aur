# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Paul Nicholson <brenix@gmail.com>
pkgname=yor-bin
pkgver=0.1.192
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
sha256sums_armv7h=('88790a3cc5f0714199921412e5c794aa5a1d9190957c8393b174482630078a8a')
sha256sums_aarch64=('9ddc819f8e175536c38bcfe2dbcbe1f4683775c7742679395cdaf6b545a6495a')
sha256sums_i686=('c734fcd7032aedfd871bd7802b0c5d0e20470cbb840575e55682ecee86e3145f')
sha256sums_x86_64=('fc904b3399b499a8298a0b10f4a60badc4ab2220cfe5ec456f9ddb9d3c5928ed')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}