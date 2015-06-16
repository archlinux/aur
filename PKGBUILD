# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-module-install-extratests'
pkgver='0.008'
pkgrel='1'
pkgdesc="contextual tests that the harness can ignore"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='http://search.cpan.org/dist/Module-Install-ExtraTests'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Module-Install-ExtraTests-0.008.tar.gz')
md5sums=('d6ccc18e5c09973feccf7f74afcd1d16')
sha512sums=('07cc51bfc44a5f8b6346ce433cc3ff16c62bf485b66c997ffce226fee140edf7107faf6eb5726e6f817a72a3afeedfd31ab5822da29131f41f03173e38770ba4')
_distdir="Module-Install-ExtraTests-0.008"

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
