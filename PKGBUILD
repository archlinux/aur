# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openscience-bin
pkgver=2.0.153
pkgrel=1
pkgdesc="The open-source AI workbench for scientific research"
arch=('x86_64' 'aarch64')
url="https://github.com/synthetic-sciences/openscience"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/synthetic-sciences/openscience/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openscience-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openscience-linux-arm64.tar.gz")
sha256sums=('d8ac5e917b2099e5cbe2999f297b56e2cc946e545f39aebc1e1aa91dd5cb0e9f')
sha256sums_x86_64=('747281fbc856e5597be8e187f005d8a12fbffe10f970f9a656ccba1846205422')
sha256sums_aarch64=('4838b9ac9132b4a1c60df5e1b13901eadd79ba3617daf5234f2a84dd0204f435')

package() {
  install -Dm755 "openscience" "${pkgdir}/usr/bin/openscience"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
