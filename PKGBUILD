# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=reylo-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Import .sql files into TypeScript with full type inference and zero codegen"
arch=('x86_64' 'aarch64')
url="https://github.com/reylosql/reylo"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/reylo-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/reylo-linux-arm64.tar.gz")
sha256sums_x86_64=('f573882ac608e7b46bcb01304d6e329c8b419efccf7fc571209c18f8915cdb95')
sha256sums_aarch64=('7185a6f866b0ac65eba2bcf0dc7821ce60b36225d37f6988301a0960e26853db')

package() {
  install -Dm755 "reylo" "${pkgdir}/usr/bin/reylo"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
