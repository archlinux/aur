# Contributor: Trizen <trizenx@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gmpf'
pkgver='0.39'
pkgrel='1'
pkgdesc="perl interface to the GMP library's floating point (mpf) functions."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'gmp>=6.1.0')
makedepends=()
url='https://metacpan.org/release/Math-GMPf'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SISYPHUS/Math-GMPf-0.39.tar.gz')
md5sums=('8570693897a5bb9f225bb5962d8e830d')
sha512sums=('4174ba838bd9097c5097fb97b6b892d8127b297db2830f66ed31900dd657e94825189df1c78f2ebd520bf1b21dac0b858356eb3a510fe12ecfe3a056df719f41')
_distdir="Math-GMPf-0.39"

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
