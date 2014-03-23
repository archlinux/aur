# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=enventor
pkgver=0.2.0
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary')
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f3bd66c9280b59af2ee8766f0bcf2049b040c8dabdcf8d2a8b11f7a16ea1fa01')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
