# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-syntax'
pkgver='0.004'
pkgrel='1'
pkgdesc="Activate syntax extensions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-optlist>=0.104' 'perl-namespace-clean')
makedepends=()
url='http://search.cpan.org/dist/syntax'
source=('http://search.cpan.org/CPAN/authors/id/P/PH/PHAYLON/syntax-0.004.tar.gz')
md5sums=('2bbeda572f7858b8c33bdf3ddf35b390')
sha512sums=('eb9e66027d626d3ac9d371f0f3b59d50b7d7e00ccf0b7af986f60b51f7a879cfd330ec4ca07bab28f5d2eef94171b65b9418b05a4ba28b4b77ab15b4bf2ef2ff')
_distdir="syntax-0.004"

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
