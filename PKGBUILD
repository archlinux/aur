# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-input-validator'
pkgver='0.001005'
pkgrel='1'
pkgdesc="Input Validator"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load' 'perl-string-camelcase')
makedepends=()
url='http://search.mcpan.org/dist/Input-Validator'
source=('http://search.mcpan.org/CPAN/authors/id/V/VT/VTI/Input-Validator-0.001005.tar.gz')
md5sums=('0e70625bb34cb4c9b419109a6b226470')
sha512sums=('91a0fb6efa1ebef19c7de9b3fcf5d725787662856d656ed20aa180fe30ce42dc471ea1fe28010e92739e06ee1c085c02fae97bff6c876816ade63edf8aac2cac')
_distdir="Input-Validator-0.001005"

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
