# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moox-types-mooselike-numeric'
pkgver='1.03'
pkgrel='1'
pkgdesc="Moo types for numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moox-types-mooselike>=0.23')
makedepends=()
checkdepends=('perl-test-fatal>=0.003')
url='https://metacpan.org/release/MooX-Types-MooseLike-Numeric'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MATEU/MooX-Types-MooseLike-Numeric-1.03.tar.gz')
md5sums=('0877534ebf63a21bab182f266076fb97')
_distdir="MooX-Types-MooseLike-Numeric-1.03"

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
