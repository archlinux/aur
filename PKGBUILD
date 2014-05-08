# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-spread-session
_realname=Spread-Session
pkgver=0.4
pkgrel=2
pkgdesc="CPAN/Spread::Session - OO wrapper for Spread messaging toolkit"
arch=('i686' 'x86_64')
url="https://metacpan.org/module/Spread::Session"
license=('Perl')
depends=('perl' 'perl-spread')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/J/JM/JMAY/$_realname-$pkgver.tar.gz")
md5sums=('861a93c1a07053eec07ab40512b32a01')

build() {
  cd  $srcdir/$_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd  $srcdir/$_realname-$pkgver
  make install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
