# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=gnumeric-pure
pkgver=0.16
pkgrel=2
pkgdesc="A Gnumeric extension which lets you use Pure functions in Gnumeric, the Gnome spreadsheet."
arch=('i686' 'x86_64')
url="https://agraef.github.io/pure-docs/gnumeric-pure.html"
depends=('gnumeric>=1.12.4' 'pure')
license=('custom')
groups=(pure-complete pure-math)
source=(https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('6fe6493bd963f8b3300807db5f6f7889')

build() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr PUREC_FLAGS=-mcpu=generic
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
