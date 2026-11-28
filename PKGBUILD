# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hprof-slurp-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="JVM heap dump analyzer"
arch=('x86_64' 'aarch64')
url="https://github.com/agourlay/hprof-slurp"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/agourlay/hprof-slurp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/hprof-slurp-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/hprof-slurp-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('ec353b1e4091b8f201f26de51685a0dcaff4a7270716234dca05d3d0d26207c1')
sha256sums_x86_64=('54de12cc4d7a22581753145b018167e7df32e16bca87b0e61a0bcfcf95700c90')
sha256sums_aarch64=('a5b42768071261fa61f55286c47a94f65bcd5065b1a6cddc8a72d73010356954')

package() {
  install -Dm755 "hprof-slurp" "${pkgdir}/usr/bin/hprof-slurp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
