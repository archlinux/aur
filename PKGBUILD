# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ctetris-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Minimal Tetris in C and raylib"
arch=('x86_64')
url="https://github.com/tmpstpdwn/cTetris"
license=('MIT')
depends=('glibc' 'libx11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cTetris-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('c987869b669f6b4e96a6104a999b30f4e8ef039a41bfba4f63581fc4b0324e2c')

package() {
  install -Dm755 "cTetris-${pkgver}-linux-x86_64/cTetris" "${pkgdir}/usr/bin/cTetris"
  install -Dm644 "cTetris-${pkgver}-linux-x86_64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "cTetris-${pkgver}-linux-x86_64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
