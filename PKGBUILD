# Contributor: Jesse McClure <jmcclure at cns dot umass dot edu>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mange
pkgver=0.1b
pkgrel=5
pkgdesc="A ncurses-based spreadsheet (eg csv, tsv) editor."
url="https://github.com/aksr/mange"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('ncurses')
optdepends=('r: plotting' 'feh: to view plots')
source=("https://github.com/aksr/$pkgname/archive/$pkgver.tar.gz")
md5sums=('86dda290c50bf7e7febaf47c6c78c86d')
sha1sums=('262008511f741ae706265ecf953484e57f8baadf')
sha256sums=('c611dedd49789e93b2236d032303ea326f3252ec41034998ad75887ffb3a8b61')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

