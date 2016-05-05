# Contributor: Ruslan Tokaev <polygynous@live.ru>
# Maintainer: Ruslan Tokaev <polygynous@live.ru>

pkgname=fehashmac

pkgver=1.5.0
pkgrel=1

pkgdesc="Generic Hash and HMAC Program"
arch=('i686' 'x86_64')
url="http://fehashmac.sourceforge.net/"
license=('GPL')
depends=(glibc)
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=(515d2d78829741e15e00331c3ed2f59d)

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure \
  --prefix=/usr \
  --exec-prefix=/usr \
  --bindir=/usr/bin \
  --sbindir=/usr/sbin \
  --libexecdir=/usr/lib/$pkgname \
  --sysconfdir=/etc \
  --libdir=/usr/lib \
  --includedir=/usr/include \
  --datarootdir=/usr/share/$pkgname \
 --mandir=/usr/share/man \
  --datadir=/usr/share/$pkgname \
  --enable-dependency-tracking \
  --sysconfdir=/etc

  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir prefix="$pkgdir/usr" install || return 1
}
