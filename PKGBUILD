# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=foremerge-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Catch intent conflicts between branches before code conflicts"
arch=('x86_64' 'aarch64')
url="https://github.com/naw103/foremerge"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/naw103/foremerge/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/foremerge-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/foremerge-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('ed49be510adc51bf9d13a4fb4d31a80e01522fca00563190c21815eca400ad04')
sha256sums_aarch64=('94e13225e45208796c122c7c52e188509a5f44dbd20efab290360cafbb8ea701')

package() {
  install -Dm755 "foremerge" "${pkgdir}/usr/bin/foremerge"
  install -Dm755 "fmg" "${pkgdir}/usr/bin/fmg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
