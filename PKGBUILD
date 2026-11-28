# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=poenskelisten-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Self-hosted wishlist sharing and gift coordination"
arch=('x86_64' 'aarch64')
url="https://github.com/aunefyren/poenskelisten"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/poenskelisten-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/poenskelisten-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('dd1db87094be4f5af6c579feccb3602f0925ede57da428f2079c972ad1688ba5')
sha256sums_aarch64=('db69e11a9a6bf22af176c2db1669c72fa0314998926125903bf555b50c18e5d0')

package() {
  install -Dm755 "poenskelisten" "${pkgdir}/usr/bin/poenskelisten"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
