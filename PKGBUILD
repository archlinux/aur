# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-geometry-planar-gpc'
pkgver='1.04'
pkgrel='1'
pkgdesc="Perl wrapper for Alan Murta's gpc library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Math-Geometry-Planar-GPC'
source=('http://search.cpan.org/CPAN/authors/id/D/DV/DVDPOL/Math-Geometry-Planar-GPC-1.04.tar.gz')
md5sums=('0f059f596abba73eee7f0ffcee134567')
sha512sums=('27971f596691c356525a9c4d4bb69e1215dc8b77a2a7854460c2afa372f3f07cf7d395d5d1f1b111963df962f9eae10a13a63d3746e15433fc233bef92d9242a')
_distdir="Math-Geometry-Planar-GPC-1.04"

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
