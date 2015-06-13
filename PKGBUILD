# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=ficl
pkgver=4.1.0
pkgrel=1
pkgdesc="Forth Inspired Command Language"
arch=('i686' 'x86_64')
url="http://ficl.sourceforge.net"
license=('custom:ficl')
depends=('glibc')
optdepends=('rlwrap: for a decent repl')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-all/ficl4.1/$pkgname-$pkgver.tar.gz?download)
md5sums=('668f12c0006b2d338c3087c53311e658')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ficl "$pkgdir/usr/bin/ficl"
  install -Dm644 doc/license.html "$pkgdir/usr/share/licenses/ficl/LICENSE"
  install -d doc/ "$pkgdir/usr/share/doc/ficl/"
  install -d contrib/xclasses "$pkgdir/usr/share/doc/ficl/xclasses/"
  cp -r doc/ "$pkgdir/usr/share/doc/ficl/"
  cp -r contrib/xclasses "$pkgdir/usr/share/doc/ficl/xclasses/"
}


