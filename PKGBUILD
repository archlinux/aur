# Maintainer: zephyrdrh <zephyrdrh at gmx dot de>
# Contributor: aksr <aksr at t-com dot me>
pkgname=lxt
pkgver=1.3c
pkgrel=1
pkgdesc="A file manager program, that was inspired by the popular DOS program XTreeGold."
arch=('i686' 'x86_64')
url="http://www.stahlke.org/dan/lxt/"
license=("BSD-3-Clause")
depends=(glibc ncurses)
source=("http://www.stahlke.org/dan/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('b52e38c005cd408c35772a4a6fc594466093fd858ee78fddeb7a44a7b39129f7669cb6c486fdb2a24334c9328ed2c5a99e46bd896772796dc709b3255c683b74')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
