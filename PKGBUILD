# Contributor: Jesse McClure <jmcclure at cns dot umass dot edu>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mange
pkgver=0.1b
pkgrel=3
pkgdesc="A ncurses-based spreadsheet (eg csv, tsv) editor."
url="http://dl.dropbox.com/u/39577570/mange-0.1b.tar.gz"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('ncurses')
optdepends=('r: plotting' 'feh: to view plots')
source=("http://dl.dropbox.com/u/39577570/$pkgname-$pkgver.tar.gz")
md5sums=('487467f857b22b35766cb33ac6afdf1d')
sha1sums=('b4ff3f91e639f2fa9ec6f79befb43c8beb612ffe')
sha256sums=('3f0d809c70bee7c26bedb1c821b73d41a5c54996809e1ef61b3a24231036f8f3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

