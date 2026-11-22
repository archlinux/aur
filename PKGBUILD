# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=miniam-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Apple Music in the terminal with true-color album art"
arch=('x86_64')
url="https://github.com/Wian1977/miniam"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Wian1977/miniam/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/miniam-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('25f7129255c1c8686e8bddde752b751901ff362342c65185d8259b80bffc7427')
sha256sums_x86_64=('04f9c388436148b1aa074a760e987e85464343e21d1d449ee9b7f9670d9fb8b3')

package() {
  cd "miniam-v${pkgver}-linux-x86_64"
  install -Dm755 "miniam" "${pkgdir}/usr/bin/miniam"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
