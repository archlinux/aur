# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-parse-errorstring-perl'
pkgver='0.19'
pkgrel='1'
pkgdesc="Parse error messages from the perl interpreter"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.7' 'perl-class-xsaccessor' 'perl-pod-pom>=0.27')
makedepends=('perl-test-differences')
url='http://search.cpan.org/dist/Parse-ErrorString-Perl'
source=('http://search.cpan.org/CPAN/authors/id/A/AZ/AZAWAWI/Parse-ErrorString-Perl-0.19.tar.gz')
md5sums=('dd28781223f9dd52c89c3c0c2ef87dc3')
sha512sums=('54e7b3bd85a2ce7244c0e95ede64f641cc3c8497e5ed9e25337297f6650c3bbd8445f3b157018c9f4f3b5fbcca55e00c5edea5f5d497bbe5352964d325fd6f6d')
_distdir="Parse-ErrorString-Perl-0.19"

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
