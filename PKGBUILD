# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-en-inflect-number'
pkgver='1.1'
pkgrel='1'
pkgdesc="Force number of words to singular or plural"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lingua-en-inflect')
makedepends=()
url='http://search.cpan.org/dist/Lingua-EN-Inflect-Number'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SIMON/Lingua-EN-Inflect-Number-1.1.tar.gz')
md5sums=('bcee940ef603da93e7da11d8eecad409')
sha512sums=('bc64ddd4ccaa5b435450f018a9547403e24c2ef017a977fd891258643f6b331368825cdc1aeda58fc59c5803b888cba4b6954c1081aecace3c96cc24d0edae63')
_distdir="Lingua-EN-Inflect-Number-1.1"

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
