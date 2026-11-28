# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dupehound-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Find duplicated code"
arch=('x86_64' 'aarch64')
url="https://github.com/Rafaelpta/dupehound"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Rafaelpta/dupehound/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dupehound-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dupehound-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('28ede1e7bf2097f76b17f52e306f13730da02b3ba529cf7711b3bd026a1a29d7')
sha256sums_x86_64=('05c86a8a88733eb31d74739a9ac432701ca30559b92375373f8ee400d2d0b9d4')
sha256sums_aarch64=('19f4a28d3344b8d334dc67a34b1b262c6187905b112c1f443ad835b087016cab')

package() {
  install -Dm755 "dupehound" "${pkgdir}/usr/bin/dupehound"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
