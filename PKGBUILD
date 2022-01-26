# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer : Salamandar <felix@piedallu.me>

pkgname='perl-math-geometry-planar-offset'
pkgver='1.05'
pkgrel='2'
pkgdesc="Calculate offset polygons"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-yaml')
makedepends=('perl-module-build')
url='https://metacpan.org/release/Math-Geometry-Planar-Offset'
source=('http://search.cpan.org/CPAN/authors/id/E/EW/EWILHELM/Math-Geometry-Planar-Offset-1.05.tar.gz')
md5sums=('1c46de114f06dd742e95b7135009c707')
sha512sums=('c83f29487db25523d3c862acaf9c4bc28fa8940079f823959db8d4b28269d5c81a83e2430b2dea56200e309595a95e5a6acefd1e1526915291c23208c32fe9f2')
_distdir="Math-Geometry-Planar-Offset-1.05"

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
