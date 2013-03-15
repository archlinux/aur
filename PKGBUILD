# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-spread-queue
_realname=Spread-Queue
pkgver=0.4
pkgrel=1
pkgdesc="CPAN/Spread::Queue - one-of-many queued messaging delivery using Spread"
arch=('i686' 'x86_64')
url="https://metacpan.org/module/JMAY/$_realname-$pkgver/Queue.pod"
license=('Perl')
depends=('perl' 'perl-spread')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/J/JM/JMAY/$_realname-$pkgver.tar.gz")
md5sums=('82b60345fc05e8c2ced86b229154482b')

build() {
  cd  $srcdir/$_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
  make install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
