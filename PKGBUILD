# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cooldeck-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Keyboard-first terminal dashboard for Coolify deployments and live logs"
arch=('x86_64' 'aarch64')
url="https://github.com/resetnak/cooldeck"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cooldeck_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cooldeck_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('be2f47db6995fff9154bb59ba1d1652b6cd2590b2a36dfee7a7fbecac656e9d4')
sha256sums_aarch64=('94890037b96181b70ac7215d2d21c41efeb3b44ae392ee4934675663c742ade1')

package() {
  install -Dm755 "cooldeck" "${pkgdir}/usr/bin/cooldeck"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
