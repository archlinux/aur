# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-time-piece'
pkgver='1.29'
pkgrel='1'
pkgdesc="Object Oriented time objects"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Time-Piece'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Time-Piece-1.29.tar.gz')
md5sums=('e8a94f2c2dadc8a7b88e43e44ca8861e')
sha512sums=('0fbff34fea73b23d709c0852c46658604a4213b4ecb3de1df2d5e2e31f8d7f3a6bf9ef42908665c5bd46996347d2425432f6e6ee9f49c9da78aeabe5f09175b1')
_distdir="Time-Piece-1.29"

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
