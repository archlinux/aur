# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-tree-simple'
pkgver='1.29'
pkgrel='1'
pkgdesc="A simple tree object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=('perl-test-exception>=0.15')
url='https://metacpan.org/release/Tree-Simple'
source=('http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Tree-Simple-1.29.tgz')
md5sums=('37df179a5271146e5b72077896114b75')
sha512sums=('d6ed79878bf9e8cb4bf82a85dd4d11c70968be53b08d73905d49fff70ec21ca53c604df1e139c0304763e592e42db831c411d03dc8cd1bbb2834cf037088b746')
_distdir="Tree-Simple-1.29"

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
