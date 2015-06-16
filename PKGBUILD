# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-stem-ru'
pkgver='0.01'
pkgrel='1'
pkgdesc="Porter's stemming algorithm for Russian (KOI8-R only)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Lingua-Stem-Ru'
source=('http://search.cpan.org/CPAN/authors/id/A/AL/ALGDR/Lingua-Stem-Ru-0.01.tar.gz')
md5sums=('b7b82495cc9f0b466b1b3cba0fd779a6')
sha512sums=('871aa32bfaf9c922c1208d82922c617bd21c4586d9f26f1f37d32f4d5250109b4c4ab652fb69c59dee7edb5e5cb3ebb82ed85e86daf600bb863d55842fdfd692')
_distdir="Lingua-Stem-Ru-0.01"

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
