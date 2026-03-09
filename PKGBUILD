# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util-gmp'
pkgver='0.52.git'
pkgrel='4'
pkgdesc="Math::Prime::Util::GMP - utilities related to prime numbers and factoring, using GMP"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.24' 'gmp>=6.1.1' 'perl>=5.6.2')
makedepends=()
_githash="27bac50f34b6784e8d197cf0eefd0f44406d1fa8"
url='https://metacpan.org/release/Math-Prime-Util-GMP'
source=("https://github.com/danaj/Math-Prime-Util-GMP/archive/$_githash.zip")
b2sums=('32c595b11efa6b06dfd2ea79d070cfda5e1753f8032b6d8c8d041b03eabdb036f0d9a8b0ecb09a5afb0a664c2cbcbc77e1ddbe251e17e2fa83bc7c12d41a9b22')
_distdir="Math-Prime-Util-GMP-$_githash"

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
