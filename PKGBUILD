# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bigtext-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Editor and log viewer for very large files"
arch=('x86_64')
url="https://github.com/erkinbek/bigtext"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/erkinbek/bigtext/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bigtext-linux-x64.tar.gz")
sha256sums=('1abe148c0be194a1fcdb711bc2668141a2db0fa6a03974698ff27905448966bf')
sha256sums_x86_64=('089792cfb5f1c88e5930a96c88cfdde5ba8540fe3bceff6abfa00e6ebdc522ba')

package() {
  install -Dm755 "bigtext-linux-x64/bigtext" "${pkgdir}/usr/bin/bigtext"
  install -Dm755 "bigtext-linux-x64/bigtext-cli" "${pkgdir}/usr/bin/bigtext-cli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "bigtext-linux-x64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

