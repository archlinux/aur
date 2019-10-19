# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>
# Maintainer: Zihao Wang <dev@wzhd.org>

pkgname=propellor
pkgver=5.9.1
pkgrel=1
pkgdesc="property-based host configuration management in haskell"
url="https://propellor.branchable.com/"
license=("custom:BSD2")
arch=('i686' 'x86_64')
depends=("stack")
source=("https://git.joeyh.name/index.cgi/propellor.git/snapshot/propellor-$pkgver.tar.gz")
sha256sums=('4ac697c1651f48318b08c0d131038bcbe8af27e28632abf065a7cca598d5f1c1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  stack build --ghc-options -O2
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  stack install --local-bin-path "${pkgdir}/usr/bin"
}
