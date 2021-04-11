# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-hide'
pkgver='0.0013'
pkgrel='1'
pkgdesc="Forces the unavailability of specified Perl modules (for testing)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
url='https://metacpan.org/release/Devel-Hide'
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCANTRELL/Devel-Hide-${pkgver}.tar.gz")
md5sums=('c43727f104694215dd9f593c85641542')
sha512sums=('acaa190dcc046ddc6c5bfb300ab2042b87bc43e67d1766cde07a83380ea3989461cec9527e0f7c1881ae7e9ac4aeb75b6255cdda287c280dabb2d5b7b9b785d6')
_distdir="Devel-Hide-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
