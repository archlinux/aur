# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-openoffice-oodoc'
pkgver='2.125'
pkgrel='1'
pkgdesc="The Perl Open OpenDocument Connector"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=1.18' 'perl-xml-twig>=3.32')
makedepends=()
url='http://search.cpan.org/dist/OpenOffice-OODoc'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMGDOC/OpenOffice-OODoc-2.125.tar.gz')
md5sums=('270f34f94d7cc627a9944749eccf678f')
sha512sums=('2366461e6166c7219070624942e559d499a1aca65697213335aaa427d0b3c472fa4c07e39ea7164343db22890143c6d1d3d1eb5be215280700ae9f5e663b0849')
_distdir="OpenOffice-OODoc-2.125"

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
