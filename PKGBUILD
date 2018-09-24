# Maintainer: John  Whitehead <littlejay19y85 at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>

pkgname=econnman
pkgver=1.1
pkgrel=1
pkgdesc="Enlightenment ConnMan user interface"
arch=('any')
url="https://phab.enlightenment.org/w/projects/econnman/"
license=('LGPL3')
depends=('python-efl' 'connman')
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('0cce87681fae7ca70f1e63cfe0ae65fdf17bc334727054317e25e3897619ed85')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS ChangeLog NEWS README
}
