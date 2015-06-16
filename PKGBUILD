# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-string-escape'
pkgver='2010.002'
pkgrel='1'
pkgdesc="Backslash escapes, quoted phrase, word elision, etc."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/String-Escape'
source=('http://search.cpan.org/CPAN/authors/id/E/EV/EVO/String-Escape-2010.002.tar.gz')
md5sums=('f48000fbade3f46e1a37a43f12c7f01a')
sha512sums=('668e196bbd95b4e9e5fc9ae3aebe0e7f1990362973bd027f2f3728f212786bc2104141ced3e024006b3ed22fa6345b968440029c98b87cbc299ac192221724c7')
_distdir="String-Escape-2010.002"

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
