# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-algorithm-munkres'
pkgver='0.08'
pkgrel='1'
pkgdesc="Perl/CPAN Module Algorithm::Munkres"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Algorithm-Munkres'
source=("http://search.cpan.org/CPAN/authors/id/T/TP/TPEDERSE/Algorithm-Munkres-$pkgver.tar.gz")
md5sums=('56349287513f955002720c8e2523582b')
sha512sums=('3dcb9cd3caf6fb71c4a6463fbf5d1897f8675be9e095a4c1c30a4fdd2b635d46ac8e7db7ff660ba3c2a361cf4d020905c1cc121e3a6802b9b89a3999d8b41278')
_distdir="Algorithm-Munkres-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

