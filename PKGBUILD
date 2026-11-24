# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=arp-scan-rs-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="Minimal ARP scanner for fast local network scans"
arch=('x86_64')
url="https://github.com/kongbytes/arp-scan-rs"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kongbytes/arp-scan-rs/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/arp-scan-v${pkgver}-x86_64-unknown-linux-glibc")
sha256sums=('20b067f86de375aae6db0f283ab2e65de24d537733b89bd58432c101259d84cf')
sha256sums_x86_64=('b2b0111b8a12adf4260e31f5269d60ee9b20e3191447723e62eb718e1a408975')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/arp-scan-rs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
