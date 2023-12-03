# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bigint'
pkgver='2.002000'
pkgrel='1'
pkgdesc="Math::BigInt - Arbitrary size integer/float math package"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
provides=('perl-math-bigfloat' 'perl-math-bigint-calc' 'perl-math-bigint-lib')

url='https://metacpan.org/release/Math-BigInt'
source=("https://cpan.metacpan.org/authors/id/P/PJ/PJACKLAM/Math-BigInt-$pkgver.tar.gz")
b2sums=('0c088a4a152f4522ab85c9e0bf6490fa79b1582c12994bb93462af52afdeb6ff5874930c07971c37bcfe737eb635eec8542c9132a37549c1c5799b3aec93a8e9')
_distdir="Math-BigInt-$pkgver"

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
