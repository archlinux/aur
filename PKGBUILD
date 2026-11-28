# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=akca-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Web security scanner"
arch=('x86_64' 'aarch64')
url="https://github.com/akha-security/akca"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/akha-security/akca/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/akca-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/akca-linux-arm64")
sha256sums=('f4d9b0aad8ff9e650f5890fa3eeb7c1311479cab901f8a9b416a2d9acaf54266')
sha256sums_x86_64=('96c29274966c3676263b3e6670df2988b52c77046e4cf0a1aa24b7f0d19e3912')
sha256sums_aarch64=('dd47354ae8ec2d98efe931c940b1afcd9ce5daa680a8f5d4dd4315db7e0a77b1')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/akca"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
