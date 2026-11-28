# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=deduplicator-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Find, sort and delete duplicate files recursively"
arch=('x86_64' 'aarch64')
url="https://github.com/sreedevk/deduplicator"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sreedevk/deduplicator/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/linux-aarch64.tar.gz")
sha256sums=('12a28441a7ca8c30d26aadb5a07021f99ad3a120769785ebdc49e2e862ea64b7')
sha256sums_x86_64=('f4c1f43a2d452fa523ff4d43dca27ba3d2ac914cc56c1bb0bff1f1e776f33af7')
sha256sums_aarch64=('fa9aa98437ea31929ad3e15eb46037c424eb9cf6791b62b985be1a190f0729f4')

package() {
  install -Dm755 "deduplicator" "${pkgdir}/usr/bin/deduplicator"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
