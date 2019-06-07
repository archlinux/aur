# CPAN Name  : Safe-Hole
# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-safe-hole'
pkgver='0.14'
pkgrel='1'
pkgdesc="make a hole to the original main compartment in the Safe compartment"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.35')
makedepends=()
url='https://metacpan.org/release/Safe-Hole'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/Safe-Hole-0.14.tar.gz')
md5sums=('c18aae4e07ed374fff0357442f411e9a')
sha512sums=('29570c5e6c2bf8709b92b62c36d24c643956535ed0cf3fa73cbe9406543f17c96d4bd37a753c02d1f77f962d76788f423816fd63d31f7f56884acefa873f30e7')
_distdir="Safe-Hole-0.14"

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
