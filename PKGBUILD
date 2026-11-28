# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=feint-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Local emulator of the Scaleway, Outscale and Exoscale APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/stephrobert/feint"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/stephrobert/feint/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/feint-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/feint-linux-arm64")
sha256sums=('50bd13042302173c9dc61dfcea5757e11caa76a0c1859a9be2fc59f148c42041')
sha256sums_x86_64=('19bb414bdb985d7e2c61ab59ac6226d7b7ba7fca9ad7cd9180fce9b7ff70b4ef')
sha256sums_aarch64=('a08f5c183dbd3aeabc4cd60bed49feda8539dc38749e41bfff8e87823642fd61')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/feint"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
