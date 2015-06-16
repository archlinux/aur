# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-json-pp'
pkgver='2.27202'
pkgrel='1'
pkgdesc="JSON::XS compatible pure-Perl module."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/JSON-PP'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAKAMAKA/JSON-PP-2.27202.tar.gz')
md5sums=('d7d6cbd3589e793aaa66a88833c02ce0')
sha512sums=('e8374a30e107f02c1226d33fb5cf063142a9c26445fed0acf0d56de901b4be007af75f1a90578568d0eb25301c8ee5eb963a7b29b6dcd4bad421d980b485d211')
_distdir="JSON-PP-2.27202"

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
