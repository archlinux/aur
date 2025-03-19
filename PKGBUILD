# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=mybible-git
pkgver=0.0.1
pkgrel=1
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="MyBible mobile application's modules terminal bible viewer"
arch=('any')
url="https://gitverse.ru/naierchou/mybible"
license=('GPL-3.0')
depends=('mybible-module-kjv' 'sqlite' 'w3m' 'fzf')
optdepends=('mybible-module-pbti' 'mybible-module-ogb' 'mybible-module-rst')
makedepends=()
source=("git+https://gitverse.ru/naierchou/mybible.git")
sha256sums=("SKIP")

package() {
  BINARY_NAME="mybible"
  PREFIX="/usr/local"
  cd "$srcdir/${pkgname%-git}"
  install -d ${pkgdir}${PREFIX}/bin
  install -m 755 ${BINARY_NAME} $pkgdir${PREFIX}/bin/${BINARY_NAME}
  install -d $pkgdir${PREFIX}/share/mybible/license/${BINARY_NAME}/
  cp LICENSE $pkgdir${PREFIX}/share/mybible/license/${BINARY_NAME}/
}
