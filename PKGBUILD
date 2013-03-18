# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-spread-client-constant
_realname=Spread-Client-Constant
pkgver=0.02
pkgrel=2
pkgdesc="CPAN/Spread::Client::Constant - Spread::Client constants"
arch=('i686' 'x86_64')
url="https://metacpan.org/module/Spread::Client::Constant"
license=('Perl')
depends=('perl' 'perl-spread')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/MB/MBAILEY/$_realname-$pkgver.tar.gz")
md5sums=('ac6e3358fcddffa0382647422d490c6e')

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
