# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goma-gateway-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Lightweight API gateway and reverse proxy with declarative config"
arch=('x86_64' 'aarch64')
url="https://github.com/jkaninda/goma-gateway"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jkaninda/goma-gateway/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/goma-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/goma-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('d169aff893994b0d4292add0b443c1b9dd48349a0702a49dd6741162bc8db285')
sha256sums_x86_64=('867b696daf79df18cd8032b4d563bc8dcfdc129a7e80cf6653fda3d44b46449d')
sha256sums_aarch64=('7c8fc8b2a87d751e4d6e6f680ae7db9249ccc3e26429fb65104a0dd313d42553')

package() {
  install -Dm755 "goma" "${pkgdir}/usr/bin/goma"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
