# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ghosttohugo-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Convert Ghost blog exports to Hugo posts"
arch=('x86_64')
url="https://github.com/jbarone/ghostToHugo"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ghostToHugo_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_x86_64=('eb29484c36c588fc9b7ec15e79a992678ed775b0c31e1695a30b84c80ff44808')

package() {
  install -Dm755 "ghostToHugo" "${pkgdir}/usr/bin/ghostToHugo"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
