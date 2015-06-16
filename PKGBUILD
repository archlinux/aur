# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-uri-openurl'
pkgver='0.4.6'
pkgrel='1'
pkgdesc="Parse and construct OpenURL's (NISO Z39.88-2004)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri>=1.19')
makedepends=()
url='http://search.cpan.org/dist/URI-OpenURL'
source=('http://search.cpan.org/CPAN/authors/id/T/TI/TIMBRODY/URI-OpenURL-0.4.6.tar.gz')
md5sums=('b64093ce6aa75b092cc907d3852d007f')
sha512sums=('93d1db63bbcd7555bab2e7020728fe597406d65d6844537e44074bb7191ced905a81db547ff7aed76d88b0e81642c2d4b5a1a536bfe7b6ff7069d1e588bb0990')
_distdir="URI-OpenURL-0.4.6"

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
