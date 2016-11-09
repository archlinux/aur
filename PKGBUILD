# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-math-combinatorics'
pkgver='0.09'
pkgrel='1'
pkgdesc="Perform combinations and permutations on lists"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Math-Combinatorics'
source=('http://search.cpan.org/CPAN/authors/id/A/AL/ALLENDAY/Math-Combinatorics-0.09.tar.gz')
md5sums=('de556a046f00789c94cf58cb7c2d9d89')
sha512sums=('6d2727f4c74242ef3b74d2ca453eab4dc08bc7bf783f27564dee0617c52936477ca120740faca7337e5e5690abe3fcc062d4a3ad90bbb06b04f66bf435357b9e')
_distdir="Math-Combinatorics-0.09"

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
