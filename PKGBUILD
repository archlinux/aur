# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=libsmf
pkgver=1.3
pkgrel=5
pkgdesc='A BSD-licensed C library for handling SMF ("*.mid") files.'
arch=('x86_64')
url="http://sourceforge.net/projects/libsmf/"
license=('BSD')
depends=('glib2' 'readline')
source=("http://downloads.sourceforge.net/project/libsmf/libsmf/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('eb698f1bc0bad9d5bce4c10386347486')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
