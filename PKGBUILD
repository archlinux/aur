# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cc-downloader-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Polite downloader for Common Crawl data"
arch=('x86_64' 'aarch64')
url="https://github.com/commoncrawl/cc-downloader"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cc-downloader-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cc-downloader-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('296f441c55243ebc229e62bf98a3418b8ca55b02d4e1e4d80509fb36b9f9ccf2')
sha256sums_aarch64=('272bed999e2cfbe2a8cb3581f6e8cce54a43634ee26cad00884825c6935432d0')

package() {
  install -Dm755 "cc-downloader" "${pkgdir}/usr/bin/cc-downloader"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
