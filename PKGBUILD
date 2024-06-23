# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-future-io'
pkgver='0.15'
pkgrel='1'
pkgdesc="Future-returning IO methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-future>=0' 'perl-struct-dumb>=0' 'perl>=5.014')
makedepends=('perl-module-build>=0.4004')
checkdepends=('perl-test-expectandcheck>=0.06' 'perl-test-future-io-impl>=0' 'perl-test2-suite>=0')
url='https://metacpan.org/release/Future-IO'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Future-IO-0.15.tar.gz')
md5sums=('3c0eb12389de2b79db78c1cf7147a3f9')
sha512sums=('e41ac5a990df2091cf0e7f88a7e24e98bb3e268118c3fca6711152065664c855ebaaba4c25c9fda9afc21c599a8d730a6fe709277fccb224234cf37d41eaee58')
_distdir="Future-IO-0.15"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
