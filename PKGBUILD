# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-cover'
pkgver='1.28'
pkgrel='1'
pkgdesc="Perl/CPAN Module Devel::Cover: Code coverage metrics for Perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser')
makedepends=()
url='https://metacpan.org/release/Devel-Cover'
source=("http://search.cpan.org/CPAN/authors/id/P/PJ/PJCJ/Devel-Cover-$pkgver.tar.gz")
md5sums=('408abc70f14f8a999b65487925a850b2')
sha512sums=('0413bfa9b976dc1b5d62793ae075ad1ad0f90947d065c4216b7f23bbbee2a565bc328df912b0e4d1b3afbcd468b9e6f04f6e85fadd2fa9b32877156034679fe1')
_distdir="Devel-Cover-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
