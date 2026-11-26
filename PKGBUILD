# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=noisia-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Harmful workload generator for PostgreSQL testing"
arch=('x86_64')
url="https://github.com/lesovsky/noisia"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/noisia_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('a70bdd984a81d667dc32e2768b812b1c9739ca0458d1623f655fa866150f5bd3')

package() {
  install -Dm755 "noisia" "${pkgdir}/usr/bin/noisia"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
