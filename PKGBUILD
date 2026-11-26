# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pg2b3dm-bin
pkgver=2.28.0
pkgrel=1
pkgdesc="Create 3D Tiles from PostGIS geometries"
arch=('x86_64' 'aarch64')
url="https://github.com/Geodan/pg2b3dm"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Geodan/pg2b3dm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/pg2b3dm-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/pg2b3dm-linux-arm64.zip")
sha256sums=('032ade9aa83fec8725a4163b1381243ab67fab43f799409e9c40cec300bc0977')
sha256sums_x86_64=('f001004968096b33e1face6757d4f705643fcb81cf9acec7bd27c3137828196c')
sha256sums_aarch64=('d220b001b3c0bff0498d920b0148c3acdcb72d93f09bc8e81cfad3dc20d602ef')

package() {
  install -Dm755 "pg2b3dm" "${pkgdir}/usr/bin/pg2b3dm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
