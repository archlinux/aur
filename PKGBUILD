# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Petrenko Alexey <alexey-p at uralweb dot ru>

pkgname=perl-io-socket-socks
pkgver=0.64
pkgrel=1
pkgdesc='Provides a way to create socks client or server both 4 and 5 version'
url="http://search.cpan.org/~oleg/IO-Socket-Socks"
depends=('perl')
arch=('any')
license=('GPL')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/O/OL/OLEG/IO-Socket-Socks-$pkgver.tar.gz)
md5sums=('f43e4b06392f3c09ad5823124eed1cc0')

build() {
  cd  "$srcdir"/IO-Socket-Socks-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor

  make
}

package() {
  cd  "$srcdir"/IO-Socket-Socks-$pkgver

  make DESTDIR="$pkgdir"/ install
}
