# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=poros-bin
pkgver=1.9.2
pkgrel=1
pkgdesc="Inject Xposed modules into apps on rooted Android devices"
arch=('x86_64')
url="https://github.com/WindySha/Poros"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/WindySha/Poros/v${pkgver}/LICENSE-Apache-2.0")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/poros-Linux-x86_64")
sha256sums=('a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9')
sha256sums_x86_64=('598679fd5db286d26575a837d284399936c7d232be61b11dba86bddefb06513b')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/poros"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
