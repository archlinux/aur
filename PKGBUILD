# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Paul Nicholson <brenix@gmail.com>
pkgname=yor-bin
pkgver=0.1.189
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
sha256sums_armv7h=('a1a26d591ec8acdb1f1c3c0bce2de87382d450fbd095a4cfd6f8fc326e70dbd6')
sha256sums_aarch64=('2daeeb17af52f47e26aea08e76a6cac867590066983a93e4f76c8181ddb5cfb7')
sha256sums_i686=('5bfc338122b6e3f87ab1080cfa5bffa7b7d367457c911a80e6a75530146a0336')
sha256sums_x86_64=('84b442f6a35af01d91bb6f49e65cce032533104bf9ab903684ac581854d2f197')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}