# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=spl-token-wallet
_pkgver="0.2.5"
pkgver="v${_pkgver}"
pkgrel=1
pkgdesc="Example Solana wallet with support for SPL tokens and Serum integration."
url='https://github.com/project-serum/spl-token-wallet'
arch=(any)
license=('Apache')
depends=('chromium')
makedepends=('yarn')
source=("${pkgname}::git+${url}#tag=$_pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}/"
  yarn add "react-scripts@4.0.3"
  yarn build:extension
  rm "${srcdir}/yarn.lock"
}

package() {
  ls $pkgdir
}

