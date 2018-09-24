# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=lmdbxx
pkgver=0.9.14.0+25+g0b43ca8
pkgrel=1
pkgdesc="C++11 wrapper for the LMDB database library"
arch=('any')
url="http://lmdbxx.sourceforge.net/"
license=('custom:Public Domain')
depends=('lmdb')
makedepends=('git')
#source=("https://github.com/drycpp/lmdbxx/releases/download/$pkgver/lmdbxx-$pkgver.tar.xz")
_commit=0b43ca87d8cfabba392dfe884eb1edb83874de02
source=("git+https://github.com/drycpp/lmdbxx.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

package() {
    cd $pkgname
    make PREFIX=/usr DESTDIR="$pkgdir/" install
    install -m644 -D UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
