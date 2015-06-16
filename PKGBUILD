# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dist-zilla-plugin-catalyst'
pkgver='0.15'
pkgrel='1'
pkgdesc="set of plugins for working with Catalyst"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-devel' 'perl-dist-zilla' 'perl-moose' 'perl-namespace-autoclean' 'perl-path-class')
makedepends=()
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-Catalyst'
source=('http://search.cpan.org/CPAN/authors/id/X/XE/XENO/Dist-Zilla-Plugin-Catalyst-0.15.tar.gz')
md5sums=('0de59938722ef96fa02a2a88c3e78b23')
sha512sums=('35e083e8ea614528f667c2a879607ae88b3ac972a88be9140385e01d0065604251c3b08630af20eabe886067dee4e078ecb37828bb036606b185e15b8c364e66')
_distdir="Dist-Zilla-Plugin-Catalyst-0.15"

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
