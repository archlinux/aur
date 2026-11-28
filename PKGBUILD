# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tuisage-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Terminal UI for running mise tasks and usage-spec commands"
arch=('x86_64' 'aarch64')
url="https://github.com/mgood/tuisage"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mgood/tuisage/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tuisage-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tuisage-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('ae1096d4b220e26991f82c6d6bdb033d8bcf9976bb389a3f9ebc4cd652237dfd')
sha256sums_x86_64=('2efbcc266b7fe9e3c36627a552303e1ebceddf6f872f2351aea0d50eedcbbc71')
sha256sums_aarch64=('6c3ccb078570ecccfd504b1ca1c82b75dec4d7207e4d6c82e07fe55ded43377b')

package() {
  install -Dm755 "tuisage" "${pkgdir}/usr/bin/tuisage"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
