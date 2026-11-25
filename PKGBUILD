# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=komari-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="A simple server monitor tool"
arch=('x86_64' 'aarch64')
url="https://github.com/komari-monitor/komari"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/komari-monitor/komari/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/komari-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/komari-linux-arm64")
sha256sums=('3f14ba28b2e275d15a274fb7c936e4fa9f6fe851d1ea96e7f7b9cd9badc4b016')
sha256sums_x86_64=('dab1a00dd273fc741795e18a2fdf4fe1b3b057478110911084abbe6929829bb2')
sha256sums_aarch64=('9ea325433e2efc04eaa72122f7ac38cacdbc20fdde5193871f76f5a5ae176552')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/komari"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
