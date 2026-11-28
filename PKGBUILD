# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cloudemu-bin
pkgver=2.15.0
pkgrel=1
pkgdesc="Local cloud provider simulator"
arch=('x86_64' 'aarch64')
url="https://github.com/stackshy/cloudemu"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cloudemu_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cloudemu_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e88da42ebef2dba7474868205b8380e7206ac7f4a1e770d6ebb57b9503967cec')
sha256sums_aarch64=('2992d8c7c59f5565a719379ce345c9d765640442a036fac1fc475da0078136e0')

package() {
  install -Dm755 "cloudemu" "${pkgdir}/usr/bin/cloudemu"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
