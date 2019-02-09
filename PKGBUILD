# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gcomplex'
pkgver='0.13'
pkgrel='1'
pkgdesc="Math::GComplex - generic complex number library for Perl."
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl')
makedepends=()
optdepends=('perl-math-anynum: for working with arbitrary large numbers')
url='https://metacpan.org/release/Math-GComplex'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Math-GComplex-${pkgver}.tar.gz")
md5sums=('d39c3c0cadd3226bccd6caeb78c2320d')
sha512sums=('56992820c3502d8bbe2fe4dc56482af1c93cd9446883a43ab48a02fbf8fadd074b2fa7a9a0b8ae0f99158840103d366d1ea638a58852574bb3d2ce86700212b0')
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
  rm -r "$pkgdir"/usr/lib
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
