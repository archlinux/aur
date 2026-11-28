# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=celer-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Lightweight C/C++ package manager driven by TOML"
arch=('x86_64')
url="https://github.com/celer-pkg/celer"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/celer-pkg/celer/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/celer-amd64-linux.tar.gz")
sha256sums=('6747fad57bddc611e5e281021bc547a6bdd53872491da12691793eab83fe3076')
sha256sums_x86_64=('3dad098fcbd7546cd85e50c4e1891f00002f2b65731df8b698169343b3bfa93e')

package() {
  install -Dm755 "celer" "${pkgdir}/usr/bin/celer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
