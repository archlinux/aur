# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oxia-bin
pkgver=0.16.13
pkgrel=1
pkgdesc="Metadata store and coordination system"
arch=('x86_64' 'aarch64')
url="https://github.com/oxia-db/oxia"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/oxia-db/oxia/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/oxia-oxia-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/oxia-oxia-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('36de544e66e460e97dbb6dc5031c874a8a683e63ebaa1221859efd112592f720')
sha256sums_aarch64=('799f2fc419806ff01abf13920bc2e746312a64f7dbd432fb35487b9ec13d50e8')

package() {
  install -Dm755 "bin/oxia" "${pkgdir}/usr/bin/oxia"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
