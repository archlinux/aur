# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pure-g2
pkgver=0.3
pkgrel=2
pkgdesc="2D graphics interface for the Pure programming language"
arch=('any')
license=('BSD')
url="http://purelang.bitbucket.org/"
depends=('pure' 'g2')
makedepends=()
groups=(pure-complete pure-graphics)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('75bf1aa42c3eeb39fa0395871bad6ac232b719b5')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
