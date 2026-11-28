# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=coasts-bin
pkgver=0.1.53
pkgrel=1
pkgdesc="Localhost service isolation and orchestration for git worktrees"
arch=('x86_64' 'aarch64')
url="https://github.com/coast-guard/coasts"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/coast-guard/coasts/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/coast-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/coast-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('247b4986e8ac8722fd89fbfa3e104d3014e7e8d809746a222d4bd30ad5001763')
sha256sums_x86_64=('1700ffa4fbd9a59b97f71b2ba2039ed50f50510f0824e988890a6ead7d95ad77')
sha256sums_aarch64=('8b2c1aaae5d2748cd9908ed16f8f422fe18a8d7f9521c23394cbbc2c68d741db')

package() {
  install -Dm755 "coast" "${pkgdir}/usr/bin/coast"
  install -Dm755 "coastd" "${pkgdir}/usr/bin/coastd"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
