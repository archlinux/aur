# Contributor: Marc Cousin <cousinmarc@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-validate-struct'
pkgver='0.12'
pkgrel='1'
pkgdesc="Validate recursive Hash Structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-validate>=0.06' 'perl-data-validate-ip>=0.18' 'perl-regexp-common>=0')
makedepends=()
url='https://metacpan.org/release/Data-Validate-Struct'
source=('http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/Data-Validate-Struct-0.12.tar.gz')
sha512sums=('4e0e4f7f6e3292f2ad8ea296a7821417f875d3a1985f93028554c06b82b2507b2835f0a2a7f42dbd81c40d2a58088aa165088b25ccbb91c148d62fb292b39850')

_distdir="Data-Validate-Struct-0.12"

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
