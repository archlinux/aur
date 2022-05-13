# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=ormolu
pkgver=0.5.0.0
pkgrel=2
pkgdesc="A formatter for Haskell source code"
arch=('i686' 'x86_64')
url="https://github.com/tweag/${pkgname}"
license=('custom')
depends=('gmp')
makedepends=('stack')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7c2ddab13dab93e4176295ba96ee145a4822f263d14fe4e190e6f877277c463f')

build() {
  cd "${pkgname}-${pkgver}"
  stack build
}

package() {
  cd "${pkgname}-${pkgver}"
  stack install --local-bin-path "${pkgdir}/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
