# Contributor: Justin Davis <jrcd83@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-test-longstring'
pkgver='0.17'
pkgrel='1'
pkgdesc="tests strings for equality, with more helpful failures"
_dist='Test-LongString'
arch=('any')
url='http://search.cpan.org/dist/Test-LongString'
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
makedepends=()
source=("http://search.cpan.org/CPAN/authors/id/R/RG/RGARCIA/${_dist}-${pkgver}.tar.gz")
sha512sums=('1c0cd6fea35bb72816451ce0790002c9dfb945390bc85d22d04670dd5af7ebbe795307ad361e2615ce4ab4f02a317a3aa5d297f2165bd3b1f6de40b3240f1352')

build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
