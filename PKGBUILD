# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-dbi-frozen'
pkgver='301.3.0.1'
pkgrel='1'
pkgdesc="Class::DBI, frozen at 3.0.1"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0.18' 'perl-class-data-inheritable>=0.02' 'perl-class-trigger>=0.07' 'perl-ima-dbi>=0.33' 'perl-universal-moniker>=0.06')
makedepends=()
url='http://search.cpan.org/dist/Class-DBI-Frozen'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Class-DBI-Frozen-301-3.0.1.tar.gz')
md5sums=('834971643ffee38632b6702e92bef692')
sha512sums=('08d2617422f4a808731e5d8419e8847477f98786be644ad90c66528378f00d82b389369b03eeec1af74a8f0ce9e00ed5245e9861e5a527b9630f9de8bf21d2f0')
_distdir="Class-DBI-Frozen-301-3.0.1"

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
