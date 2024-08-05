# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Paul Nicholson <brenix@gmail.com>
pkgname=yor-bin
pkgver=0.1.199
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
sha256sums_armv7h=('b8e3b18f54bf522137e58050b9dbd9c8e0d2d1ffcfa64a421c0c983ab8b5e7c1')
sha256sums_aarch64=('8271874ffb2ed34c20e4bfe18c3c893e15e5be5c128ffe440c91c42679ea5817')
sha256sums_i686=('8a5372d63bdcaddc69e2ef71666c6eacba3f47ba357b8e88ac6d0f2bc7d97d4f')
sha256sums_x86_64=('3c8660b9220a8835a55e897df239a836a4962bd390ead92e5ce3a252f4383ea0')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}