# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gmpf'
pkgver='0.44'
pkgrel='1'
pkgdesc="Math::GMPf - perl interface to the GMP library's floating point (mpf) functions."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'gmp>=6.1.0')
makedepends=()
url='https://metacpan.org/release/Math-GMPf'
source=("https://cpan.metacpan.org/authors/id/S/SI/SISYPHUS/Math-GMPf-$pkgver.tar.gz")
md5sums=('16ce6ea86bd0ee54e18ea3084d60523f')
sha512sums=('e7c5e1e18c422884c89366a74a3edfeea82125467f0bb44936b949fce6363e64424789658a8bcecda049c7b4a02b12df43a0d1a04d1d6e7fb46e4cf27de6cc33')
_distdir="Math-GMPf-$pkgver"

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
