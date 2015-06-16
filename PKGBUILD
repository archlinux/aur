# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-chart-gnuplot'
pkgver='0.20'
pkgrel='1'
pkgdesc="Plot graph using Gnuplot in Perl on the fly"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Chart-Gnuplot'
source=('http://search.cpan.org/CPAN/authors/id/K/KW/KWMAK/Chart/Gnuplot/Chart-Gnuplot-0.20.tar.gz')
md5sums=('8dcff94f2079db52b26f5010ade5aeee')
sha512sums=('31739ae70b19e85f018069a40ec1cbc34247d42c046f40497d000e5a1c89268066526d082af990a2161f9497ee3a307a119f2c16395af42844d79a355fec8a9e')
_distdir="Chart-Gnuplot-0.20"

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
