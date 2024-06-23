# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-compress-lzma'
pkgver='2.212'
pkgrel='1'
pkgdesc="Write lzma files/buffers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-compress-raw-lzma>=2.212' 'perl-io-compress>=0')
makedepends=()
url='https://metacpan.org/release/IO-Compress-Lzma'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.212.tar.gz')
md5sums=('e4d82e1072caa3b6b0065ef3fbd27c30')
sha512sums=('2b773ce3175b165a1db6a572a188ec3dfb4fe9fe46b083bc2d2c3a0461360657100c2f7779ce81687ef95a20c75e3446024fe54ca6c3615b296baead8b602dbc')
_distdir="IO-Compress-Lzma-2.212"

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
