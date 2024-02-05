# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-module-locate'
pkgver='1.80'
pkgrel='1'
pkgdesc="locate modules in the same fashion as require and use"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.8')
makedepends=()
url='https://metacpan.org/release/Module-Locate'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Module-Locate-1.80.tar.gz')
md5sums=('22b1d51200c35b6bc276c1e70bbb8ab3')
sha512sums=('b917d871fe84ae5e362543957bad2da22416dce5d82bf31764900893a6924b7e6c59785aa85af08ed01d5cd30a240665af3d4e57968e41d2c7fc05e540e46422')
_distdir="Module-Locate-1.80"

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
