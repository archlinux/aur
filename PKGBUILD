# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=code-pathfinder-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Static code analysis with inter-file taint analysis for security teams"
arch=('x86_64' 'aarch64')
url="https://github.com/shivasurya/code-pathfinder"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/shivasurya/code-pathfinder/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pathfinder-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pathfinder-linux-arm64.tar.gz")
sha256sums=('e7b7c2cae50514abdacd06a8ea4f09330f0573f82ac86d4967a3de754384c563')
sha256sums_x86_64=('132493f6972a5366c270b914895bb6a701029e326fa2e0380f4230eb670b4244')
sha256sums_aarch64=('f4e5c4a2831564c64e7abf0b663ce98720357586145e036919928d50d3a099df')

package() {
  install -Dm755 "pathfinder" "${pkgdir}/usr/bin/pathfinder"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
