# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dbdev-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="CLI for the Postgres database package registry"
arch=('x86_64' 'aarch64')
url="https://github.com/supabase/dbdev"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/supabase/dbdev/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dbdev-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dbdev-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('9b78bbb5a12f0e1928691f09604c788f8b8b4db59cdb82f9924679cf9beae5d2')
sha256sums_x86_64=('911e66420682cea8d694a75134327daaf069cb686662f16a8e6f9b13c39d67b0')
sha256sums_aarch64=('5b867c60eaee70b02bdec66543b507817937678b30eb3fa5480cc267130f15b8')

package() {
  install -Dm755 "./dbdev" "${pkgdir}/usr/bin/dbdev"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
