# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-moosex-types-laxnum'
pkgver='0.04'
pkgrel='1'
pkgdesc="A LaxNum type which provides the loose behavior of Moose's Num pre-2.10"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/MooseX-Types-LaxNum'
source=('http://search.cpan.org/CPAN/authors/id/S/SW/SWEETKID/MooseX-Types-LaxNum-0.04.tar.gz')
md5sums=('f6f5a571d509006f0bba0a181580746c')
sha512sums=('ee2eaa2838ed6b941e53b7fff1dbf82fc581e3720b935869535445012fe9a7bea3a68fd47d4142b0e4579cb1046eea48ab78d240abf250f1440e0f536d3a5640')
_distdir="MooseX-Types-LaxNum-0.04"

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
