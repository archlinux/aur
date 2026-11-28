# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kexa-bin
pkgver=2.11.1
pkgrel=1
pkgdesc="Rule-based cloud monitoring and alerting"
arch=('x86_64' 'aarch64')
url="https://github.com/kexa-io/Kexa"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kexa-io/Kexa/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/kexa-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/kexa-linux-arm64")
sha256sums=('0ce90447e845cf072f1a498b9762afb0988a1176a385b24056ad5eceaf9c7e93')
sha256sums_x86_64=('895601c571251810b072b99e158e6a06ee0a3939af4f9381b937c93d1903c22a')
sha256sums_aarch64=('3c35645270ebd240ecce9c6777842b0ded31205f8a20b96f4d9f149df63a9fcb')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/kexa"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
