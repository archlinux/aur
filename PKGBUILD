# Maintainer: csicar <aur@csicar.de>
pkgname=psgo-git
pkgver=0.0.1
pkgrel=1
pkgdesc="PureScript Go Compiler"
arch=(any)
url="https://github.com/andyarvanitis/purescript-native"
license=('BSD3')
depends=('go')
optdepends=()
makedepends=('stack')
source=('https://github.com/andyarvanitis/purescript-native/archive/golang.zip')
sha256sums=('SKIP')

build() {
  cd $srcdir/purescript-native-golang
  stack build

}

package() {
  cd $srcdir/purescript-native-golang

  install -Dm755 .stack-work/dist/*-linux-tinfo6/Cabal-*/build/psgo/psgo "$pkgdir/usr/bin/psgo"
  install -Dm644 "$srcdir/purescript-native-golang/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
