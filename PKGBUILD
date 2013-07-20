#Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=etrophy
pkgver=0.5.1
pkgrel=2
pkgdesc="EFL based library that manages scores, trophies and unlockables"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary')
options=('!libtool' '!emptydirs')
source=("http://download.enlightenment.org/releases/$pkgname-$pkgver.tar.bz2")
md5sums=('ed8aabe52b71e54db6f9104725e61645')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
