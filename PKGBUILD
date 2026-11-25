# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dynacat-bin
pkgver=3.0.4
pkgrel=1
pkgdesc="Dashboard focused on dynamic reloading and easy integration with external applications"
arch=('x86_64' 'aarch64')
url="https://github.com/Panonim/dynacat"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Panonim/dynacat/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dynacat-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dynacat-linux-arm64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('8498beb8675018bebb2124be54c29c3e5c4193a2a22b8b6a0bade2d49fcd44d8')
sha256sums_aarch64=('71561914ceb9dbf329e1be4ff8151bd1cdd8393ee66c6f498bfe3866aab02c01')

package() {
  install -Dm755 "dynacat" "${pkgdir}/usr/bin/dynacat"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
