# Submitter: TDY <tdy@archlinux.info>
# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=fsvs
pkgver=1.2.11
pkgrel=1
pkgdesc="A fast system versioning tool via subversion backend"
arch=('i686' 'x86_64')
url="https://doc.fsvs-software.org/"
license=('GPL3')
depends=('pcre' 'subversion')
source=(https://github.com/phmarek/fsvs/archive/refs/tags/$pkgname-$pkgver.tar.gz)
md5sums=('26d99eb7317837856300b15be45cf2f3')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  AUTOHEADER=true autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  install -Dm755 src/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/man/man5/" doc/$pkgname-*.5
  install -Dm644 -t "$pkgdir/usr/share/man/man1/" doc/$pkgname.1
}
