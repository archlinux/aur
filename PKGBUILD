# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=watt-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="CPU frequency and power management utility"
arch=('x86_64' 'aarch64')
url="https://github.com/NotAShelf/watt"
license=('MPL-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/NotAShelf/watt/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/watt-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/watt-linux-arm64")
sha256sums=('dc85005949e0479365d7828d938e0ecbe46990076ee90166f4c6f062c515ecae')
sha256sums_x86_64=('295cdbebda0f04301a00d9fedd0152ebd3ff02812682e56aa49c04cc487b259d')
sha256sums_aarch64=('e321b0ca573263b7ff81ec3cfac6fb6d91ee19a2d8dfde01427357b7caf7fd22')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/watt"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
