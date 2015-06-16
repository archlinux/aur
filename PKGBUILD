# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-dbi-plugin-countsearch'
pkgver='1.02'
pkgrel='1'
pkgdesc="get COUNT(*) results from the database with search functionality"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-dbi>=0.95')
makedepends=()
url='http://search.cpan.org/dist/Class-DBI-Plugin-CountSearch'
source=('http://search.cpan.org/CPAN/authors/id/H/HO/HOLBROOK/Class-DBI-Plugin-CountSearch-1.02.tgz')
md5sums=('f030e7d98161a4f9c05bf53a36d9eb3b')
sha512sums=('9e2db508809bb22caa4379feb9d76021bef2d59cb81b64fe1765635218fb34f1cc68a15af9584649f77bfa33339fa703e93623fa26c25f1314c1e093975da39a')
_distdir="Class-DBI-Plugin-CountSearch-1.02"

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
