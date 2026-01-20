# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-builder-compiler'
pkgver='0.035'
pkgrel='1'
pkgdesc="An interface around different compilers."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-extutils-builder>=0.016' 'perl-extutils-config>=0.007' 'perl-extutils-helpers>=0.027' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/ExtUtils-Builder-Compiler'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Builder-Compiler-$pkgver.tar.gz")
md5sums=('509775f5dade1b4278b901510126a8a5')
sha512sums=('0b04a584eb49d8628853ca1299111eb4b6bd9c76aef359747e83d3d0e90164113be65bab7127acc92a952f09618a3e7cc692540056b727ad6a05959869a2f4e3')
_distdir="ExtUtils-Builder-Compiler-$pkgver"

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
