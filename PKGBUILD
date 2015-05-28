# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=enventor
pkgver=0.5.1
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl)"
arch=('i686' 'x86_64')
url="https://phab.enlightenment.org/w/projects/enventor/"
license=('BSD')
depends=('elementary')
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('829f6cde04e46346cdd57edf5cecd2a7ed6a2a4992da2a5898f60b324e60be27')

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

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
