# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Paul Nicholson <brenix@gmail.com>
pkgname=yor-bin
pkgver=0.1.198
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
sha256sums_armv7h=('1b30428a91b16967dd01fa678a0d289e9b9d83107b450d9412efcd3bbd7be83a')
sha256sums_aarch64=('4329d4ca56489a9a77cfaece37cf89b399dc253fe4e6ce353c4c35002ec69822')
sha256sums_i686=('33806a46e7a99609f9f31c10c75d67a4e7f0ac1c308016fdda8a14500791aa03')
sha256sums_x86_64=('6b1893e87c4a190867fb4fa982ad1f05311f5a944c711905bd13527863b0f1e2')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}