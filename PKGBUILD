# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=azurehound-bin
pkgver=3.1.3
pkgrel=1
pkgdesc="Azure data exporter for BloodHound"
arch=('x86_64' 'aarch64')
url="https://github.com/SpecterOps/AzureHound"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/SpecterOps/AzureHound/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/AzureHound_v${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/AzureHound_v${pkgver}_linux_arm64.zip")
sha256sums=('01e2419d68912b7888cc2fd3889aba27b5291b693db4a42a1795428c925aba40')
sha256sums_x86_64=('b814116a9850658ef36be54c3f8e2d1560a0560ca377052206defac064e5a68d')
sha256sums_aarch64=('e41b5fe366fc47e4e9fb3d0454177843f6d92fcea56b400af0a256e9bcc55afa')

package() {
  install -Dm755 "azurehound" "${pkgdir}/usr/bin/azurehound"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
