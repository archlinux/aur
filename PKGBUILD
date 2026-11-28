# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=termviz-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="ROS visualization in the terminal"
arch=('x86_64')
url="https://github.com/carzum/termviz"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/termviz-v${pkgver}-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('581adc39dec1a8a8c1f88efcfa05e0bc4c1597caabe0405a9f280ae1dfa959e9')

package() {
  install -Dm755 "termviz-v${pkgver}-x86_64-unknown-linux-gnu/termviz" "${pkgdir}/usr/bin/termviz"
  install -Dm644 "termviz-v${pkgver}-x86_64-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "termviz-v${pkgver}-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
