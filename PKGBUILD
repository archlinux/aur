# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-business-onlinepayment'
pkgver='3.02'
pkgrel='1'
pkgdesc="Perl extension for online payment processing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-net-https-any' 'perl-tie-ixhash')
makedepends=()
url='http://search.cpan.org/dist/Business-OnlinePayment'
source=('http://search.cpan.org/CPAN/authors/id/I/IV/IVAN/Business-OnlinePayment-3.02.tar.gz')
md5sums=('a5a0482cacb2837d9d03400136d31a21')
sha512sums=('a5cdf7897edfd5ff789bf8d8b7b0c19091c69288f602373decd629f0e0cd8f62a1ff3004e93e41b5964eb4af0adf6b4bb9bd439576048b4e00f5cfd5c388c3d3')
_distdir="Business-OnlinePayment-3.02"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
