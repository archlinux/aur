# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kimchi-bin
pkgver=1.42.3
pkgrel=1
pkgdesc="Terminal coding agent powered by Kimchi's multi-model orchestration"
arch=('x86_64' 'aarch64')
url="https://github.com/getkimchi/kimchi"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/getkimchi/kimchi/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kimchi_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kimchi_linux_arm64.tar.gz")
sha256sums=('f1d4bccc8cbd1beb2adee81b287ea2631c368c6c930e080b113fcd22638ca700')
sha256sums_x86_64=('0c02aa869717ccdc94b6a2b6dc6d32bd97e459b1ac35a6e7e16faf3c9a5ca01d')
sha256sums_aarch64=('14a110ae76447da65f99402e07bc821844ede2a0608e5e009afb21602b05f04d')

package() {
  install -Dm755 "bin/kimchi" "${pkgdir}/usr/bin/kimchi"
  install -Dm755 "share/kimchi/bin/proxy-helper" "${pkgdir}/usr/bin/proxy-helper"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
