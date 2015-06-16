# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-devel-cycle'
pkgver='1.12'
pkgrel='1'
pkgdesc="Find memory cycles in objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Devel-Cycle'
source=('http://search.cpan.org/CPAN/authors/id/L/LD/LDS/Devel-Cycle-1.12.tar.gz')
md5sums=('3d9a963da87b17398fab9acbef63f277')
sha512sums=('e2c83829905449d13c86233ad5bfce28e7b4eca61a8ac1e2f73e3c906a2d8580f66ae84d865ef876c38c2d25f0a5a8adeb05f6e94594274d8a5fa1739842d08d')
_distdir="Devel-Cycle-1.12"

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
