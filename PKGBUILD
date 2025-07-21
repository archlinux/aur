# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-string-truncate'
pkgver='1.100603'
pkgrel='2'
pkgdesc="a module for when strings are too long to be displayed in..."
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-sub-exporter>=0.953' 'perl-sub-install>=0.03' 'perl>=5.012')
makedepends=()
url='https://metacpan.org/release/String-Truncate'
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/String-Truncate-$pkgver.tar.gz")
md5sums=('b7cb3fe0683e111f005cd168fc614bda')
sha512sums=('6a6adeda78f5e649d09b1d9297c1d48566a373569edf34a1c1a5a55af221449d2243909563457836fb2d66b0811203cfb26268dd2fbdf0bb4cee3d37ffcdc0fe')
_distdir="String-Truncate-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
