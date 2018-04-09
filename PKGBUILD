# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gcomplex'
pkgver='0.09'
pkgrel='1'
pkgdesc="Math::GComplex - generic complex number library for Perl."
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl')
makedepends=()
optdepends=('perl-math-anynum: support for arbitrary large numbers')
url='https://metacpan.org/release/Math-GComplex'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Math-GComplex-${pkgver}.tar.gz")
md5sums=('8f7b580ff574074e1c77cfc1c562e4df')
sha512sums=('1982d81ec1269222aafcfb032efb9d8d5b301adf6676d7a4a205c9d97a20270d02b5e201eb5437c9cfd40638fde967737d95004931d381bfa5d7cb691a8efaa9')
_distdir="Math-GComplex-${pkgver}"

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
