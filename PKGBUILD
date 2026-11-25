# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=codapi-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="Sandbox server for interactive code examples"
arch=('x86_64' 'aarch64')
url="https://github.com/nalgeon/codapi"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/codapi_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/codapi_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4778aca294e7eba8170e8301c2705b2474ba7ddd157ef7ae98959b7504e96388')
sha256sums_aarch64=('d8aa512147d7df314264c15fede6a082a2a2bc1717fb01eeb70c93b39304da27')

package() {
  install -Dm755 "codapi" "${pkgdir}/usr/bin/codapi"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
