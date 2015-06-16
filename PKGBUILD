# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-sub-override'
pkgver='0.09'
pkgrel='1'
pkgdesc="Perl extension for easily overriding subroutines"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-fatal>=0.010')
url='http://search.cpan.org/dist/Sub-Override'
source=('http://search.cpan.org/CPAN/authors/id/O/OV/OVID/Sub-Override-0.09.tar.gz')
md5sums=('6889e2526c0e4f70da157fdf712542d3')
sha512sums=('35000e8cabb6ca4cc0cac53af99fc9cb8ac14b1e71dbfa27dc58a339cb1b54e439064f2241798e351cc5ad297a2f9e4fde870ca97e2eb09a2430c11af589d412')
_distdir="Sub-Override-0.09"

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
