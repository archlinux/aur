# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gitmoji-cli-bin
pkgver=9.7.0
pkgrel=1
pkgdesc="Interactive gitmoji commit tool"
arch=('x86_64')
url="https://github.com/carloscuesta/gitmoji-cli"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/carloscuesta/gitmoji-cli/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gitmoji-linux")
sha256sums=('463f3ada26f78ec3b566ce12fa09982e60e5f8c06e6e8dec1f32b559c4f4d5a6')
sha256sums_x86_64=('db0051ef085b3230d3bf9140be567fadb63bf776503e6780180c904e6ddfcba6')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gitmoji"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
