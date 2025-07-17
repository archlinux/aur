# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util-gmp'
pkgver='0.52'
pkgrel='3'
pkgdesc="Math::Prime::Util::GMP - utilities related to prime numbers and factoring, using GMP"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.24' 'gmp>=6.1.1' 'perl>=5.6.2')
makedepends=()
url='https://metacpan.org/release/Math-Prime-Util-GMP'
source=("https://cpan.metacpan.org/authors/id/D/DA/DANAJ/Math-Prime-Util-GMP-$pkgver.tar.gz")
b2sums=('765dff6a9898abe60038a68288061c8395d11b954c5fa46a9e71a94c88cb48dd4c02eead5a1b945757215863e9b318bd362fcd088c83d77245d23b8730071877')
_distdir="Math-Prime-Util-GMP-$pkgver"

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
