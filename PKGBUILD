# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-string-camelcase'
pkgver='0.04'
pkgrel='2'
pkgdesc="camelcase, de-camelcase"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/String-CamelCase'
source=("http://search.cpan.org/CPAN/authors/id/H/HI/HIO/String-CamelCase-${pkgver}.tar.gz")
md5sums=('356ad81554d5214ee44101eda2fe719a')
sha512sums=('b5a5c1b2f2b3a0be3c25891948ce456d8fccf6247a52efc4045c6607a45108caa92a7f12240ab57b618a27b8c42bf8855e9b1cd84a14bce0151e93954c93b256')
_distdir="String-CamelCase-${pkgver}"

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
