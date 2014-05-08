# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-spread-message
_realname=Spread-Message
pkgver=0.21
pkgrel=2
pkgdesc="CPAN/Spread::Message - provide messaging using the Spread toolkit"
arch=('i686' 'x86_64')
url="https://metacpan.org/module/Spread::Message"
license=('Perl')
depends=('perl' 'perl-spread')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/MA/MARKPF/$_realname-$pkgver.tar.gz")
md5sums=('995863a6415049cfd7f7ece9c61b5574')

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
