# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util-gmp'
pkgver='0.50'
pkgrel='1'
pkgdesc="Utilities related to prime numbers and factoring, using GMP"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.24' 'gmp>=6.1.1' 'perl>=5.6.2')
makedepends=()
url='https://metacpan.org/release/Math-Prime-Util-GMP'
source=("https://cpan.metacpan.org/authors/id/D/DA/DANAJ/Math-Prime-Util-GMP-$pkgver.tar.gz")
md5sums=('84dab5f4f56c685b0d39e2a408805f5d')
sha512sums=('c4ad2be97369e56eea569cc6257fcdf94aeef884cdc23cab3d76f96921fda2d3f5f582a3a99934aabf5d4bad66ca8eca751ae555b6eb3e071711a3ab695ec4a7')
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
