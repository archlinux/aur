# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nforwardauth-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Minimal forward authentication service for reverse proxies"
arch=('x86_64' 'aarch64')
url="https://github.com/nosduco/nforwardauth"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nosduco/nforwardauth/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nforwardauth-x86_64-unknown-linux-gnu-v${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nforwardauth-aarch64-unknown-linux-gnu-v${pkgver}.tar.gz")
sha256sums=('1689b3079e298a55b3fd4c10e35b617325624016e14c3a417497777301e1a89f')
sha256sums_x86_64=('484eca702c58b203211a7e25adf8a9aaf8402ffd5a6966dd86485cda87642fbf')
sha256sums_aarch64=('57e7b3e2fc2bdaab80222c8df61c593c7599679da9c6b46b02b31f77021f00d1')

package() {
  install -Dm755 "nforwardauth" "${pkgdir}/usr/bin/nforwardauth"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
