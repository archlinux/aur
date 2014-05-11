# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: wayseeker <putnik.dzen at gmail dot com>

pkgname=wmauda
pkgver=0.9
pkgrel=2
pkgdesc="Remote control dockapp for audacious"
url="http://www.netswarm.net/"
license=('GPL')
depends=(audacious2)
arch=('i686' 'x86_64')
source=(http://www.netswarm.net/misc/$pkgname-$pkgver.tar.gz
	$pkgname.patch)
md5sums=('2b194221c0cebbb87fd57da4bf024f13'
         '5f3f37a5939358de0f92371828f672ce')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -b -z .orig -i "$srcdir/$pkgname.patch"
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
md5sums=('2b194221c0cebbb87fd57da4bf024f13'
         'ce4988f82bcfb0d754c10b4d578b8a18')
