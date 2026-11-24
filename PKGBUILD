# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nanocore-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="NanoCore 8-bit CPU emulator"
arch=('x86_64' 'aarch64')
url="https://github.com/afaanbilal/nanocore"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/afaanbilal/nanocore/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nanocore-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nanocore-linux-arm64.tar.gz")
sha256sums=('1d44934ee5d71d4ca6d1f1aa5c4384b8cf74eb781844d5621db55c7fbe30a719')
sha256sums_x86_64=('c5f96acaf22a29534be8a01a4b010a4dfad9d922134d2a5f3852b9d6cf3fccab')
sha256sums_aarch64=('869c02541f45108c5362935041d1cf25730351824db613a9e22b5e52edd94ff5')

package() {
  install -Dm755 "nanocore" "${pkgdir}/usr/bin/nanocore"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
