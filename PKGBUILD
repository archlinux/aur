# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dist-zilla-plugin-notabstests'
pkgver='0.01'
pkgrel='1'
pkgdesc="Release tests making sure hard tabs aren't used"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla' 'perl-moose' 'perl-namespace-autoclean')
makedepends=('perl-test-notabs')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-NoTabsTests'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Dist-Zilla-Plugin-NoTabsTests-0.01.tar.gz')
md5sums=('8304e0878b035c02b774dc851bf6448d')
sha512sums=('b2fbaf24eb5d60f1345f527bfb5f931679c77c7e72fb5b125992dd60a133124fda68e073756c30fc04a467961d23b71388a04c715bdc9e2e15e0ff43563e0a07')
_distdir="Dist-Zilla-Plugin-NoTabsTests-0.01"

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
