# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-data-validate-email'
pkgver='0.04'
pkgrel='1'
pkgdesc="common email validation methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-validate-domain>=0.04' 'perl-email-address')
makedepends=()
url='http://search.cpan.org/dist/Data-Validate-Email'
source=('http://search.cpan.org/CPAN/authors/id/S/SO/SONNEN/Data-Validate-Email-0.04.tar.gz')
md5sums=('25ddfadb1aa7bf909e62bb2002589e41')
sha512sums=('38e978881dfdbf191b82f4ead38c73f7af65682739bfcc739a82a70fcb5b5b0769581a78bf1441f6ce2125277698454b14415d1c4542f2eadc31ed6354e2e0b2')
_distdir="Data-Validate-Email-0.04"

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
