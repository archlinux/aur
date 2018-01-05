# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ustr
pkgver=1.0.4
pkgrel=4
pkgdesc="micro string API for C"
arch=(x86_64)
url="http://www.and.org/ustr/"
license=('GPL')
depends=('glibc')
source=(http://www.and.org/ustr/$pkgver/ustr-$pkgver.tar.bz2)
md5sums=('93147d9f0c9765d4cd0f04f7e44bdfce')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/doc/man "$pkgdir"/usr/share/
}
