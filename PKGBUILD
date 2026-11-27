# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=configarr-bin
pkgver=1.40.0
pkgrel=1
pkgdesc="Sync TRaSH Guides and custom configs with Sonarr and Radarr"
arch=('x86_64' 'aarch64')
url="https://github.com/raydak-labs/configarr"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/raydak-labs/configarr/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/configarr-linux-x64.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/configarr-linux-arm64.tar.xz")
sha256sums=('3c2c95ba9cd306762be1d3636575c0051b076831d197d9d3be9d1000c622025d')
sha256sums_x86_64=('896d50b15d909d865eb7c4d5b3c0a59361358d203820c4a044d6b9736260ef0b')
sha256sums_aarch64=('f0d50d34ef4aab49714a43c321cc772da1da432cf214eaa3d43017f769945ad9')

package() {
  install -Dm755 "configarr" "${pkgdir}/usr/bin/configarr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
