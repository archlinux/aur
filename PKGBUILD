# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=traefik-kop-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Docker to Redis to Traefik service discovery agent"
arch=('x86_64' 'aarch64')
url="https://github.com/jittering/traefik-kop"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/traefik-kop_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/traefik-kop_linux_arm64.tar.gz")
sha256sums_x86_64=('af1d9fd9c6f0baefb144a4be0a9239b29a46ae232cdd11bde9eb5ca5c02a9309')
sha256sums_aarch64=('c0ddf81349b1d04b39b958c1a9a319e0ebffaf12df00e8b3476c32feea4a3c96')

package() {
  install -Dm755 "traefik-kop" "${pkgdir}/usr/bin/traefik-kop"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
