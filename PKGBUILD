# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
#
# TODO: Write a pkg-conf file

pkgname=libident
pkgver=0.32
pkgrel=4
pkgdesc='Library for querying IDENT servers'
arch=('x86_64' 'i686')
url="http://www.remlab.net/libident/"
license=('custom')
options=('!libtool')
source=("http://www.remlab.net/files/libident/libident-$pkgver.tar.gz")
sha256sums=('8cc8fb69f1c888be7cffde7f4caeb3dc6cd0abbc475337683a720aa7638a174b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm755 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
