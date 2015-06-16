# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-tree-simple'
pkgver='1.18'
pkgrel='1'
pkgdesc="A simple tree object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-exception>=0.15')
url='http://search.cpan.org/dist/Tree-Simple'
source=('http://search.cpan.org/CPAN/authors/id/S/ST/STEVAN/Tree-Simple-1.18.tar.gz')
md5sums=('70462938108a8b8658b1b1d2f12dbeab')
sha512sums=('f5918a865667db84800a5ff1a423c118f6e41c1b1930eb323d4afdaaf8a9da5554a0ac85eced3d1b9635065ff045f4ff6aab874c26771b8b4d36511fcc941ac0')
_distdir="Tree-Simple-1.18"

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
