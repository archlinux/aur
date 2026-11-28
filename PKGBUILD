# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mikrotik-exporter-bin
pkgver=1.0.11
pkgrel=1
pkgdesc="Prometheus exporter for MikroTik devices"
arch=('x86_64' 'aarch64')
url="https://github.com/nshttpd/mikrotik-exporter"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nshttpd/mikrotik-exporter/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/mikrotik-exporter_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/mikrotik-exporter_linux_arm64")
sha256sums=('3e50d567e122051889d9e8edccf7cbcf39345243b8253e298551d08d9b64f49d')
sha256sums_x86_64=('427da58b434de23df27d94d09d7fcc386445a89445a251418b06e593e7a4f4e1')
sha256sums_aarch64=('1a3dca8bef3b2cccac85b6cd00d5d3f0d6cb40ff729d9d450c6add83edb5311f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mikrotik-exporter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
