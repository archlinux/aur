# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=u++
pkgver=7.0.0
pkgrel=1
epoch=
pkgdesc="uC++ from the University of Waterloo"
arch=('i686' 'x86_64')
url="https://plg.uwaterloo.ca/~usystem/pub/uSystem/"
license=('LGPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($url$pkgname-$pkgver.sh)
md5sums=('df976558a5505c8e59e37e60ac09a09f')
sha256sums=('45addb9e42113e55c7d990d7c8a12c78cc7b0108b7d35059b21554dc5e78ab4c')
sha512sums=('4210b2bfd47c040c14a087d7bcd7f3195d2241151dcc9576c7f8028bbbf0e467d4d91a56eb6f58ab583ac9eadc4ee6d7b2a25d81f5a1d4f7284ed74ab5480e7a')
noextract=()

prepare() {
  cd "$srcdir"
  sh "$pkgname-$pkgver.sh" -e
  bsdtar -xf "$pkgname-$pkgver.tar.gz"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALLPREFIX=/usr linux-x86_64
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make INSTALLPREFIX="$pkgdir/usr/" install
}

# vim:set ts=2 sw=2 et:
