# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=old-man-yells-at-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Make Abe yell at stuff"
arch=('x86_64' 'aarch64')
url="https://github.com/oncilla/old-man-yells-at"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/old-man-yells-at_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/old-man-yells-at_Linux_arm64.tar.gz")
sha256sums_x86_64=('728d81ac3686e6fd058b1a1cd9b37fdea46afc69b492d64c3a23a039fd80cbdb')
sha256sums_aarch64=('ebcafad5c25c20c1b8e6dbd176832dea8bcf49f4f86b27981999f3e76cb346e6')

package() {
  install -Dm755 "old-man-yells-at" "${pkgdir}/usr/bin/old-man-yells-at"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
