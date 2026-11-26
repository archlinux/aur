# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=liza-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Disciplined multi-agent coding system"
arch=('x86_64' 'aarch64')
url="https://github.com/liza-mas/liza"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/liza-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/liza-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('0b44c5a73f1b4331ce16755c72ac9328c84b21bed0f94a7a207ca746999bf5c5')
sha256sums_aarch64=('eda82bb3acdc1944d3ab18622457546b4d900ce7ac134e418404c3e14b7927ca')

package() {
  install -Dm755 "liza" "${pkgdir}/usr/bin/liza"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
