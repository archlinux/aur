# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-future-io'
pkgver='0.16'
pkgrel='1'
pkgdesc="Future-returning IO methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-future>=0' 'perl-struct-dumb>=0' 'perl>=5.014')
makedepends=()
checkdepends=('perl-test-expectandcheck>=0.06' 'perl-test-future-io-impl>=0')
url='https://metacpan.org/release/Future-IO'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Future-IO-0.16.tar.gz')
md5sums=('1f20f9a2f698f27cc9a07b1831ebd500')
sha512sums=('9e5a9bf839127693ae028673ffa6bf47480fae1347e9b0c48b5f17380c35b221f15e9f86092165d2f04747f4652a7ce5dda7d8d43e89df8101abe07d3acb7491')
_distdir="Future-IO-0.16"

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
