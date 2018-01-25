# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gcomplex'
pkgver='0.07'
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
md5sums=('620d36b7421324409d60fb8bcbf9c4f4')
sha512sums=('276c970cec0d4124c6e3bb2eaa6267e9b0b24516bfe669659e2915c0cc12feaa1e3ddbfba5f81388aaded73791a7270200a883ee9b57792ed73539bb8f33c08b')
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
