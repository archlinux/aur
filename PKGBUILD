# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=reward-bin
pkgver=0.7.15
pkgrel=1
pkgdesc="Orchestrate Docker-based development environments"
arch=('x86_64' 'aarch64')
url="https://github.com/rewardenv/reward"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/rewardenv/reward/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/reward_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/reward_Linux_aarch64.tar.gz")
sha256sums=('0d47a7d46f2a59d7eab31cee6da6917d2683eb38eb7f5ceef2d4b8d50ddc2451')
sha256sums_x86_64=('7663dcf3d5ce90fa0328b7ee4b4e9900f468d54c054890f3c63d14d26936374c')
sha256sums_aarch64=('e903cbc0efe98ddd15bf1826f960c707c895a166f525edcb98569b8109289ed2')

package() {
  install -Dm755 "reward" "${pkgdir}/usr/bin/reward"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
