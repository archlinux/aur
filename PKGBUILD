# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=megrez-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="GPU resource management platform"
arch=('x86_64' 'aarch64')
url="https://github.com/XShengTech/MEGREZ"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/XShengTech/MEGREZ/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/megrez-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/megrez-linux-arm64.tar.gz")
sha256sums=('4df3c306dddaaf4baffdff5ca820cc679ac8cd6dc263c6a74517783e42fa7a3b')
sha256sums_x86_64=('4e5ca6aaa08c52ec15ced9ed0c31b2e47c8506da6e4d4c709abb3ab8d3e0f557')
sha256sums_aarch64=('a2a6092906d5dbcf963d2a407e44cc2efcbf758640e53f1d9c328c34d3853ffd')

package() {
  install -Dm755 "megrez" "${pkgdir}/usr/bin/megrez"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
