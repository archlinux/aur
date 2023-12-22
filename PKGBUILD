# Maintainer: maanoobh <maanoobh at gmail dot com>
# Contributor:	markzz <mark dot weiman at markzz dot com>
# Contributor:  fxbru <frxbru|at|gmail|dot|com>
# Contributor:	TDY <tdy|at|gmx|dot|com>
# Contributor:	Andrea Scarpino <bash.lnx|at|gmail|dot|com>

pkgname=pcalc
pkgver=5
pkgrel=1
pkgdesc="A command-line programmer's calculator handling HEX/DEC/OCT/BIN"
arch=('any')
url="https://github.com/vapier/pcalc"
license=('GPL')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vapier/pcalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('41a5fb412d1eded782158474d27816fa4845a7146bc6a357a77a2b3618d03875e1099bbb61a0d2463654361c2ff2ddb7354cdc6bfa3c95d7d9149b0780f2d09b')

build() {
  cd "$srcdir"
  bsdtar -xf $pkgname-$pkgver.tar.gz || return 1
  make -C $pkgname-$pkgver || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 EXAMPLE "$pkgdir/usr/share/doc/$pkgname/EXAMPLE"
}
