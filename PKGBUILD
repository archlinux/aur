# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-math-prime-xs'
pkgver='0.26'
pkgrel='1'
pkgdesc="Detect and calculate prime numbers with deterministic tests"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-boolean' 'perl-params-validate')
makedepends=()
url='http://search.cpan.org/dist/Math-Prime-XS'
source=('http://search.cpan.org/CPAN/authors/id/K/KR/KRYDE/Math-Prime-XS-0.26.tar.gz')
md5sums=('5bd7727093742cc85cd6c762422c98c8')
sha512sums=('4054114b320e15c349c6620fcd8b2ae6a94b590f2be2a6301577dae09aef3058f901cafd669ea9846c0b7adaaad46e18552cdf147c8412b297d96d5f3bbd6fa4')
_distdir="Math-Prime-XS-0.26"

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
