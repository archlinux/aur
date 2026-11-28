# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=traffic-guard-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Traffic blocker and firewall management tool"
arch=('x86_64' 'aarch64')
url="https://github.com/dotX12/traffic-guard"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dotX12/traffic-guard/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/traffic-guard-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/traffic-guard-linux-arm64")
sha256sums=('64857d0f06df728bdd4455dd6bfda224f30c5aefca3938727f12e5cb9ed8c30c')
sha256sums_x86_64=('1bd3ab5dd07bba19301e7b2c88630da3ddc7ce6e66deb24c4f1f11d756eb152e')
sha256sums_aarch64=('6eb16250a3fe354ec222107fb17d14ac98c9c5199649c13f67953971995b270e')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/traffic-guard"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
