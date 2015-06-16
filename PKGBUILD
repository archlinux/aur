# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalystx-menu-suckerfish'
pkgver='0.03'
pkgrel='1'
pkgdesc="Generate HTML UL for a CSS-enhanced Suckerfish menu"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-catalystx-menu-tree' 'perl-html-parser' 'perl-html-tree' 'perl-mro-compat')
makedepends=()
url='http://search.cpan.org/dist/CatalystX-Menu-Suckerfish'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/CONVERTER/CatalystX-Menu-Suckerfish-0.03.tar.gz')
md5sums=('d423d75c50afbe8e07ba7bcb3136afc3')
sha512sums=('6de8151706036ca5658ade71dfe9957c1ec89ae5244cb4eda60018c3b48e202868e632e171388f85bf0797a8c6e6ed3fd736592c7792b3292dcb21e7eda73331')
_distdir="CatalystX-Menu-Suckerfish-0.03"

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
