# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jmal-cloud-server-bin
pkgver=2.16.10
pkgrel=1
pkgdesc="Self-hosted private cloud storage"
arch=('x86_64' 'aarch64')
url="https://github.com/jamebal/jmal-cloud-server"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jamebal/jmal-cloud-server/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jmalcloud-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/jmalcloud-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('5db5f3dd77a044bd27fc0b2456aa8d97f50de7393b63d7b86ca6a64690c2a9ea')
sha256sums_x86_64=('2a1561ff6575f1b83bc6a4d84f390bbc9c0d95df0a78420c1dfd02c3cc85ff9d')
sha256sums_aarch64=('135fc80f17271e75a363333f7951097686253e9bdf354974cf1e8d2ae6ef3d86')

package() {
  install -Dm755 "jmalcloud" "${pkgdir}/usr/bin/jmalcloud"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
