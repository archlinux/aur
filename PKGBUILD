# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-business-onlinepayment-surepay'
pkgver='0.01'
pkgrel='1'
pkgdesc="SurePay backend for Business::OnlinePayment"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-business-onlinepayment' 'perl-net-ssleay')
makedepends=()
url='http://search.cpan.org/dist/Business-OnlinePayment-SurePay'
source=('http://search.cpan.org/CPAN/authors/id/A/AK/AKHOBOV/Business-OnlinePayment-SurePay-0.01.tar.gz')
md5sums=('64da3ecbced4e55c2a5c339474655002')
sha512sums=('05843a38d06a890e320c631db4095a0f0b30161ef63ea5e5b02ee461591ec54c24ce1e76b88d60bb34128591ffa9c1e809a639b647ebeb97ac88c9e15453374f')
_distdir="Business-OnlinePayment-SurePay-0.01"

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
