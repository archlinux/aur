# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cxx2flow-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Turn C/C++ code into flowcharts"
arch=('x86_64')
url="https://github.com/Enter-tainer/cxx2flow"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Enter-tainer/cxx2flow/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/cxx2flow-linux-amd64")
sha256sums=('6154befc1b3f139d5f4858b1ea08f5ec5d040791c70fcb3ad9d9f2d5e85bd767')
sha256sums_x86_64=('215bf5e565d181e97c1280f1583519947a5be80bb37aacec5f14359b44a25dd8')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/cxx2flow"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
