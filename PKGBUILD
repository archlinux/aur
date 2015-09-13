# Contributor: kaptoxic at yahoo com
# Contributor: Henrik Hallberg <halhen at k2h dot se>
pkgname=smu
pkgver=1.4
pkgrel=1
pkgdesc="A simplified markdown dialect and interpreter"
url="https://github.com/Gottox/smu"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('glibc')
source=(https://github.com/Gottox/smu/archive/v1.4.tar.gz)
md5sums=('576a45ba54a7e43bedbb2ae3ae691f3a')

build() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR=$pkgdir
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR=$pkgdir install || return 1
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
