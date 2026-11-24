# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rsadsb-radar-bin
pkgver=2025.05.03
pkgrel=1
pkgdesc="TUI radar display of ADS-B aircraft data from a demodulator"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/rsadsb/adsb_deku"
license=('MIT')
depends=('glibc' 'libgcc')
optdepends=('dump1090_rs: ADS-B demodulator for SDR devices')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/rsadsb/adsb_deku/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/radar-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/radar-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${_dl}/radar-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('f7da773cec0de4be0124b7d81ca74856abb299c85f4fafc1315fba0be787d703')
sha256sums_x86_64=('33feafb8759e9fea7f42cc0c397911d353c1770ee9c783907f0989870af340b1')
sha256sums_aarch64=('d81afe1e2b2972e2aec2cf13a38ec32ac5a0253e2ca18eae4cb7d78419b64b37')
sha256sums_armv7h=('ddc36409fc6c413a3b31e3d99ceee3fb2df0633cb6492af8e95de956d74a53dd')

package() {
  install -Dm755 "radar" "${pkgdir}/usr/bin/radar"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
