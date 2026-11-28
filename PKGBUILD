# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=calypdf-bin
pkgver=0.5.1.0
pkgrel=1
pkgdesc="Fast cross-platform PDF reader"
arch=('x86_64')
url="https://github.com/CalyPdf/CalyPdf"
license=('MIT')
depends=('fontconfig' 'freetype2' 'glibc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/CalyPdf/CalyPdf/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/caly.linux.x64.${pkgver}.zip")
sha256sums=('ba74bd130cd45f34b660754e7601e2708b94a53dfacbea6055badda5bb39520f')
sha256sums_x86_64=('7d1ce90aa1949de8b7e11dcb5863d246919aa0cf35539b2e9c0afb897568a5d6')

package() {
  install -Dm755 "caly" "${pkgdir}/usr/bin/caly"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
