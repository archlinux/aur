# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-barcode-code128'
pkgver='2.21'
pkgrel='2'
pkgdesc="Perl/CPAN Module Barcode::Code128: Generate CODE 128 bar codes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Barcode-Code128'
source=('http://search.cpan.org/CPAN/authors/id/W/WR/WRW/Barcode-Code128-2.21.tar.gz')
md5sums=('27cf162cb919445ba916ce347e6a2936')
sha512sums=('64ca60529d6a99fe73757739a3535da279006c0002c8d7d6e8d27f71511dc92db6c85bb55031fd74bff1fb9e80e623a625bfb373e682daca02c8670d51d819aa')
_distdir="Barcode-Code128-2.21"

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
