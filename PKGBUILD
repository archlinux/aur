# Maintainer: Daniel Jenssen <daerandin@gmail.com>
pkgname=sh2_mp_ai_enabler
pkgver=0.3
pkgrel=2
pkgdesc="Stronghold 2 Multiplayer AI Enabler"
arch=('x86_64')
url="https://gitlab.com/Daerandin/sh2_mp_ai_enabler"
license=('GPL3')
depends=()
optdepends=()
options=('strip')
source=(https://gitlab.com/Daerandin/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
validpgpkeys=('40EB5B887AF9E9AB68C06179CCDE95DE8A5C8CC6')
sha256sums=('840c4c94907f733d466ef8ad81fd78f01ade2f2f5ce2375bc0114d4c94d682c4')

build() {
  cd "$pkgname-$pkgver/src"
  make
}

package() {
  cd "$pkgname-$pkgver/src"
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 "sh2_mp_ai_enabler" "$pkgdir/usr/bin/"
}
