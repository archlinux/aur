# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nodepassdash-bin
pkgver=4.0.8
pkgrel=1
pkgdesc="Web dashboard for managing NodePass"
arch=('x86_64' 'aarch64')
url="https://github.com/NodePassProject/NodePassDash"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/NodePassDash_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/NodePassDash_Linux_arm64.tar.gz")
sha256sums_x86_64=('6bc6a8a1868710665a904e086f8f33ac8785ad1bd8c812a90777ed77ef0a0b5f')
sha256sums_aarch64=('82de7394de89e011afbf18c7ac6cad2dda1163149765ce54cff6d05b7c836ddf')

package() {
  install -Dm755 "nodepassdash" "${pkgdir}/usr/bin/nodepassdash"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
