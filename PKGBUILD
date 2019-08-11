# Maintainer: csicar <aur@csicar.de>
pkgname=pscpp-git
pkgver=0.0.1
pkgrel=1
pkgdesc="PureScript C++ Compiler"
arch=(any)
url="https://github.com/andyarvanitis/purescript-native"
license=('BSD3')
depends=('gcc')
optdepends=()
makedepends=('stack')
source=('https://github.com/andyarvanitis/purescript-native/archive/master.zip')
sha256sums=('SKIP')

build() {
  cd $srcdir/purescript-native-master
  stack build

}

package() {
  cd $srcdir/purescript-native-master

  install -Dm755 .stack-work/dist/*-linux-tinfo6/Cabal-*/build/pscpp/pscpp "$pkgdir/usr/bin/pscpp"
  install -Dm644 "$srcdir/purescript-native-master/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
