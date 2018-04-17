# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-bigint-gmp'
pkgver='1.6005'
pkgrel='1'
pkgdesc="Math::BigInt::GMP - backend library for Math::BigInt etc. based on GMP"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gmp>=6.1.2' 'perl>=5.6.1' 'perl-math-bigint>=1.999812')
makedepends=()
url='https://metacpan.org/release/Math-BigInt-GMP'
source=("https://cpan.metacpan.org/authors/id/P/PJ/PJACKLAM/Math-BigInt-GMP-$pkgver.tar.gz")
md5sums=('742793598b074cb4fcec26a45d5cb381')
sha512sums=('def74976f332c01ff100a9912b47116706689edaaa89c0dce188e923c83f1b1324145b1f74991b4c308f5300d158a0d3d1be8c4ec431618395e821e460a12bbf')
_distdir="Math-BigInt-GMP-$pkgver"

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
