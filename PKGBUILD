# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=notcrawl-bin
pkgver=0.6.13
pkgrel=1
pkgdesc="Local-first Notion crawler into SQLite and Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/openclaw/notcrawl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/notcrawl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/notcrawl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1933d3f8887065b60772cb6525d1c2437db47b78063285aed52f060755ed1b86')
sha256sums_aarch64=('085e560cb49b8f4896ee290de44dda7f5edc763f8f911ea5f3007af5afdb83fc')

package() {
  install -Dm755 "./notcrawl" "${pkgdir}/usr/bin/notcrawl"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
