# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dir2opds-bin
pkgver=1.12.2
pkgrel=1
pkgdesc="Self-hosted OPDS ebook server for any folder"
arch=('x86_64' 'aarch64')
url="https://github.com/dubyte/dir2opds"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dir2opds_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dir2opds_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('09ee7870c8a2fe5e80d7dc62e101d3b75ae13bb39ab8abed4e30fed867d04872')
sha256sums_aarch64=('80b692e9fadc87a702533974682f918847c82f15d4ed5fa5f9fc0d7602a43ee0')

package() {
  install -Dm755 "dir2opds" "${pkgdir}/usr/bin/dir2opds"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
