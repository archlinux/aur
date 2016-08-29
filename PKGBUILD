# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util'
pkgver='0.59'
pkgrel='1'
pkgdesc="Utilities related to prime numbers, including fast sieves and factoring"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.24' 'perl>=5.6.2' 'perl-bytes-random-secure>=0.23')
optdepends=('perl-math-prime-util-gmp: the GMP backend for Math::Prime::Util (highly recommended)')
makedepends=()
url='https://metacpan.org/release/Math-Prime-Util'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DANAJ/Math-Prime-Util-$pkgver.tar.gz")
md5sums=('f44d56dbfe7e282aceba64f239a39fff')
sha512sums=('63dcf9658404c322b86b340db9aca237cab22954e44adfe1992c93c768d35dc191159ae268c27db8cd15242e2c54fd0e28f3f7813d1a8f8b5b9bb3d8f5931652')
_distdir="Math-Prime-Util-$pkgver"

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
