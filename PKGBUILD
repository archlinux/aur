# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-critic-toomuchcode'
pkgver='0.18'
pkgrel='1'
pkgdesc="Perl-critic find unused imports"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
url='https://metacpan.org/dist/Perl-Critic-TooMuchCode'
source=("https://cpan.metacpan.org/authors/id/G/GU/GUGOD/Perl-Critic-TooMuchCode-$pkgver.tar.gz")
md5sums=('09107814791c8619ec7e36cd27b9fa93')
sha512sums=('0cab4af37272f68f35c22d200711afc23e67508f062347a0f94abf6010f885bed9bae344dc2fdbcaae4e0defcde91cdefabefe57f0c0fb140eeb3c22ac7e865b')
_distdir="Perl-Critic-TooMuchCode-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  ./Build test
}

package() {
  cd "$srcdir/$_distdir"
  ./Build install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
