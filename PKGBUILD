# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-encoding-fixlatin'
pkgver='1.04'
pkgrel='1'
pkgdesc="takes mixed encoding input and produces UTF-8 output"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Encoding-FixLatin'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/Encoding-FixLatin-1.04.tar.gz')
md5sums=('c3a2c7fac21788cd7f8035b0fd1e5cf9')
sha512sums=('7091e503b11c9d1c5a3dd38156467cf398ae4b96e1c109db4781478dfb100c2cc50e688c742392f66b9f195b936c19cafe003fffe4fc0459165b02622c154f72')
_distdir="Encoding-FixLatin-1.04"

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
