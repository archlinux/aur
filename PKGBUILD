# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gcomplex'
pkgver='0.06'
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
md5sums=('3898d9a38884af424f06d2cf1f45d710')
sha512sums=('4f43c000a567a7e966aadf334d894af2ef05c069f48ed5f96276e99e9cc15ba6f47134123ea0bcb87a9a294b2eda63a6aa1c12aec099c0e5bcd208b31dfa3410')
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
