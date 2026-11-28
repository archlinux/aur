# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oxbuild-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Fast TypeScript and JavaScript compiler"
arch=('x86_64')
url="https://github.com/DonIsaac/oxbuild"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/oxbuild-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a024692f4bb67c5c5663c5aee5f0e3e6b1e1cbd1eb44b429ddea0e1197e85a58')

package() {
  install -Dm755 "oxbuild-x86_64-unknown-linux-gnu/oxbuild" "${pkgdir}/usr/bin/oxbuild"
  install -Dm644 "oxbuild-x86_64-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "oxbuild-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
