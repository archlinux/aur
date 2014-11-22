# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=enventor
pkgver=0.4.1
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl)"
arch=('i686' 'x86_64')
url="https://phab.enlightenment.org/w/projects/enventor/"
license=('BSD')
depends=('elementary')
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('1d35dd9e286763396c6229a5a3a447e182cf92d13f9ba2f4192b88b63bc4d542')

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
