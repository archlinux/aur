# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-widget'
pkgver='1.11'
pkgrel='1'
pkgdesc="HTML Widget And Validation Framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor' 'perl-class-accessor-chained' 'perl-class-data-accessor' 'perl-date-calc' 'perl-email-valid' 'perl-html-scrubber' 'perl-html-tree' 'perl-module-pluggable-fast')
makedepends=('perl-test-nowarnings')
url='http://search.cpan.org/dist/HTML-Widget'
source=('http://search.cpan.org/CPAN/authors/id/C/CF/CFRANKS/HTML-Widget-1.11.tar.gz')
md5sums=('62f582be030a322b225ced8f03012905')
sha512sums=('60ce8cca8e9467b206fda1b54df4dfb6f380ff171bc492b0a2dde391a0d118706f69fe5e1b512244ef088b82e46c06ba839c0a7762287da909498cc79421e469')
_distdir="HTML-Widget-1.11"

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
