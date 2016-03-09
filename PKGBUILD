# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-tree-simple'
pkgver='1.26'
pkgrel='1'
pkgdesc="A simple tree object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=('perl-test-exception>=0.15')
url='https://metacpan.org/release/Tree-Simple'
source=('http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Tree-Simple-1.26.tgz')
md5sums=('a8a1de42927e11f88afb02706386e39d')
sha512sums=('0cc4ac630d1ccbbc0fa0cea6fa7304ccb6ee950e319acdd41154c71f05c98e939bb47d0a45bbe56c79caadbbeed2fe9c2b93da966cfb559443499ef69f8ba3e6')
_distdir="Tree-Simple-1.26"

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
