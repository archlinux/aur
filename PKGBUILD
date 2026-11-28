# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kodama-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Typst-friendly static Zettelkasten site generator"
arch=('x86_64' 'aarch64')
url="https://github.com/kodama-community/kodama"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kodama-community/kodama/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kodama-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kodama-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')
sha256sums_x86_64=('b898fb7f0a094b96447c23c2d2e6d7d7061c13c4a93e020b2360298f7c094462')
sha256sums_aarch64=('623e9b72e7fb75d1fb8fe8f3335a439b0d5ba84ca52bb643989524e5abd671c2')

package() {
  install -Dm755 "kodama" "${pkgdir}/usr/bin/kodama"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
