# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-x11-protocol-more
_cpanname=X11-Protocol-More
pkgver=0.01
pkgrel=1
pkgdesc="CPAN/X11::Protocol::Enhanced -- extensions to X11::Protocol"
arch=('any')
url="https://metacpan.org/module/X11::Protocol::Enhanced"
license=('GPL')
depends=('perl-x11-protocol')
options=('!emptydirs')
source=("http://www.cpan.org/authors/id/B/BI/BIDULOCK/$_cpanname-$pkgver.tar.gz")
md5sums=('0e79d1d7d3886f864ea354f6af88b456')

build() {
  cd "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_cpanname-$pkgver"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
