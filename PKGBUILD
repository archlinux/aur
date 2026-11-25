# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=codeleveler-bin
pkgver=1.0.29
pkgrel=1
pkgdesc="Local coding agent that leaves reviewable changes"
arch=('x86_64')
url="https://github.com/dengmengmian/codeleveler"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/leveler-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fd22d3b3f8c8bc96c71b3923296813c4870088282970b5cc95ae57f5adc73386')

package() {
  install -Dm755 "leveler-v${pkgver}-x86_64-unknown-linux-gnu/leveler" "${pkgdir}/usr/bin/leveler"
  install -Dm644 "leveler-v${pkgver}-x86_64-unknown-linux-gnu/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "leveler-v${pkgver}-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
