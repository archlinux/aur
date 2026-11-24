# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hud-tokio-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Find code blocking Tokio workers with eBPF"
arch=('x86_64')
url="https://github.com/cong-or/hud"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'hud')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cong-or/hud/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/hud-linux-x86_64.tar.gz")
sha256sums=('23793655f604da85d3f846a79b0a786a160edc9deede2339ddaea5cb3aa7b1ba')
sha256sums_x86_64=('a3ab93ae67c6e4d6e5069f3d7b757b36d60509554040918966677880e76fbc1a')

package() {
  install -Dm755 "hud" "${pkgdir}/usr/bin/hud"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
