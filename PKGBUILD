# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-set-light'
pkgver='0.04'
pkgrel='1'
pkgdesc="(memory efficient) unordered set of strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-array-refelem')
makedepends=('perl-extutils-makemaker>=6.6302')
url='http://search.cpan.org/dist/Set-Light'
source=('http://search.cpan.org/CPAN/authors/id/T/TE/TELS/set/Set-Light-0.04.tar.gz')
md5sums=('b131e80c84bb7f8941a53834929c5f82')
sha512sums=('266a2de871320417bb38911f687b1653adbd94ede508c7e9f9396b36b74d6bfc3bfb464b9754d895d7f4d91771ce04910e03ffecb7a31508b8e98f3487ede8cd')
_distdir="Set-Light-0.04"

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
