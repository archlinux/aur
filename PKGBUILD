# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-time-piece'
pkgver='1.31'
pkgrel='1'
pkgdesc="Object Oriented time objects"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Time-Piece'
source=('http://search.cpan.org/CPAN/authors/id/E/ES/ESAYM/Time-Piece-1.31.tar.gz')
md5sums=('034c584a88232b122667cc594f544ca8')
sha512sums=('ad7a3eb5ff6db99ce90e0001322e71c583951e9f8627b7f51ab7db0cc368272514ed625a1d6666b9759c5920bbbfcfa67fdad08d7ae586b5eef364a843cf758a')
_distdir="Time-Piece-1.31"

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
