# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util-gmp'
pkgver='0.40'
pkgrel='1'
pkgdesc="Utilities related to prime numbers and factoring, using GMP"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.24' 'gmp>=6.1.1' 'perl>=5.6.2')
makedepends=()
url='https://metacpan.org/release/Math-Prime-Util-GMP'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DANAJ/Math-Prime-Util-GMP-$pkgver.tar.gz")
md5sums=('639ac5231646e8d5898adc30c49b4b28')
sha512sums=('9c58f743955a39d39b5680b7a8e096f38f3e64cde7565b6c878867711a5ef03d5f4123b74c25cef2e548d34756f56abe584c9ad4a9d4ebd69c576be9125d30e0')
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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
