# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-spread-messaging
_realname=Spread-Messaging
pkgver=0.03
pkgrel=1
pkgdesc="CPAN/Spread::Messaging - a perl extension to the Spread Group Communications toolkit"
arch=('i686' 'x86_64')
url="https://metacpan.org/module/Spread::Messaging"
license=('Perl')
depends=('perl' 'perl-spread')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/K/KE/KESTEB/$_realname-$pkgver.tar.gz")
md5sums=('9d8e30c081c70cab93f2383625e79890')

build() {
  cd  $srcdir/$_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
  make install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
