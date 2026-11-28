# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=voxeldash-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Dashboard for Minecraft and Hytale servers"
arch=('x86_64')
url="https://github.com/gnmyt/VoxelDash"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gnmyt/VoxelDash/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/voxeldash-one-${pkgver}-linux-x64.tar.gz")
sha256sums=('46b0459a67869928fc7d1dcfacb5ae6d3c1f769f32fba02482074de5ea6afa72')
sha256sums_x86_64=('2e2401916d119bfe19fc1c57dd6b2b42b74484357126107177ccf6c0db209bc4')

package() {
  install -Dm755 "voxeldash-one-${pkgver}-linux-x64/voxeldash-one" "${pkgdir}/usr/bin/voxeldash-one"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
