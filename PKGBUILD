# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-date-korean'
pkgver='0.0.2'
pkgrel='1'
pkgdesc="Conversion between Korean solar / lunisolar date."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-date-iso8601' 'perl-datetime' 'perl-datetime-calendar-julian')
makedepends=()
url='http://search.cpan.org/dist/Date-Korean'
source=('http://search.cpan.org/CPAN/authors/id/A/AE/AERO/Date-Korean-0.0.2.tar.gz')
md5sums=('8742a8c70fa3e8a5c1fdac7b16624e0c')
sha512sums=('1283a335356a124ab114fc7122ab3b63d67cf5ff315f4885bd86412d6cb2fdf32948dfe48168193ce9d7f9edfa3865b7f7f1e0a193fb10a92c59bdacdbbd3354')
_distdir="Date-Korean-0.0.2"

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
