# Contributor: Trizen <trizenx@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gmpq'
pkgver='0.38'
pkgrel='1'
pkgdesc="perl interface to the GMP library's rational (mpq) functions."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'gmp>=6.1.0')
makedepends=()
url='https://metacpan.org/release/Math-GMPq'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SISYPHUS/Math-GMPq-0.38.tar.gz')
md5sums=('46d9301f2ba07933fb40b0a7d1efcab5')
sha512sums=('d407be2f815faad15b4253701c8b3940718333cb4770d614382959d31899dd528db2fbef9e854e486193d809ac62d85164c89ec3b9a4b3edf3e63bc19b184c7f')
_distdir="Math-GMPq-0.38"

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
