# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=holon-bin
pkgver=0.61.1
pkgrel=1
pkgdesc="Local workbench for always-on AI agents"
arch=('x86_64')
url="https://github.com/holon-run/holon"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/holon-run/holon/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/holon-linux-amd64.tar.gz")
sha256sums=('f7f222f158ee8777294fb46434f69658fcec61cf116c7614d2aaa0e6fe1d14de')
sha256sums_x86_64=('7a77cda152b3e7acad5c7faaa540a147a4cf1c415d173f902167272eec9923af')

package() {
  install -Dm755 "holon" "${pkgdir}/usr/bin/holon"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
