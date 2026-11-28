# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=calabi-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="Self-hosted HTTPS tunnels and private end-to-end encrypted mesh"
arch=('x86_64' 'aarch64')
url="https://github.com/calabinet/calabi"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/calabinet/calabi/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/calabi-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/calabi-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('877685920dc7ac60f199f2e0c244fde1ebb0f4ab632962c004d39a49234b4dde')
sha256sums_aarch64=('f9fd53057fcc38b0efc49143e65c405137817303d3fdb2e222c2c339de65660f')

package() {
  install -Dm755 "calabi" "${pkgdir}/usr/bin/calabi"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
