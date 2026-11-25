# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vulcain-bin
pkgver=1.4.5
pkgrel=1
pkgdesc="Fast and idiomatic client-driven REST APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/dunglas/vulcain"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/vulcain_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/vulcain_Linux_arm64.tar.gz")
sha256sums_x86_64=('5d91ab1e67b392c1e102c3f1962f4252971e5f1e894f83fabed0a3aa45d4451c')
sha256sums_aarch64=('757731625738581018a56975ce9a97364ff51180ad014e143b300172ae690603')

package() {
  install -Dm755 "vulcain" "${pkgdir}/usr/bin/vulcain"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
