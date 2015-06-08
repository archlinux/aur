# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-test-longstring'
_pkgname='Test-LongString'
pkgver='0.15'
pkgrel='2'
pkgdesc="tests strings for equality, with more helpful failures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Test-LongString'
source=("http://search.cpan.org/CPAN/authors/id/R/RG/RGARCIA/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e628d735b8e8f33d3992541f823491c3')
sha512sums=('d50bcba177280ff6da17720bde03dce0fe2b034aa7eeaa8825ccf983cbb8e60ee8f18179e47cfd43db1cac217bf30c38d224fb3557fb76ab3b58f573fd1ef529')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
