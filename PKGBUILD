# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-time-parsedate'
pkgver='2015.103'
pkgrel='1'
pkgdesc="date parsing both relative and absolute"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Time-ParseDate'
source=('http://search.cpan.org/CPAN/authors/id/M/MU/MUIR/modules/Time-ParseDate-2015.103.tar.gz')
md5sums=('9143d075278857d21c77467d26f1603b')
sha512sums=('3c5bf09198289a889e606c806fbb225e729fa1a0af6d04056b75c4c61110e6135fce0eccd8c58a2f1db364d7d624b417f4960bdfa376d2fb9b16ecf090879fd0')
_distdir="Time-ParseDate-2015.103"

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
