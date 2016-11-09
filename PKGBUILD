# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-math-spline'
pkgver='0.02'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-math-derivative>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Math-Spline'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHORNY/Math-Spline-0.02.tar.gz')
md5sums=('64c7bb3829e1fa7e49c2bf50b358c7c7')
sha512sums=('089c013cedb5e2a87bd144e6f294a7257cb87763221ad7a9069aec7fdb41b6de9714b3a8f66a7e819c4c08739222808420c685ab02e5a1a881e38b086c945bce')
_distdir="Math-Spline-0.02"

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
