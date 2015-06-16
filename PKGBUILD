# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-tiny'
pkgver='1.05'
pkgrel='1'
pkgdesc="Lightweight, dependency free HTML/XML generation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/HTML-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/A/AN/ANDYA/HTML-Tiny-1.05.tar.gz')
md5sums=('f683dbc8e4570ba08d0fcb1f50c1b6dc')
sha512sums=('3b2da589502981fc91afc5e650fc113dfb5abc53bcda24435cd47f313cafc98e64d53fb60f16232ebabb56a34f10752b29640a444df3238888e32a96915f669a')
_distdir="HTML-Tiny-1.05"

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
