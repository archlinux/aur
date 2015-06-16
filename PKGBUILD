# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-eol'
pkgver='1.5'
pkgrel='1'
pkgdesc="Check the correct line endings in your project"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Test-EOL'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Test-EOL-1.5.tar.gz')
md5sums=('d6ae3b338c034dc747458ed0a5fb6667')
sha512sums=('bebed37b8b087ad7d989f85669043b8858e139ac87a8bd13f9e273cc13ca3248dc5ed1b62fb2f5d8854cccfacd227d07bf164e6557a811015fe7ac2d0495a16b')
_distdir="Test-EOL-1.5"

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
