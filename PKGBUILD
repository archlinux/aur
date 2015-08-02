# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-devel-hide'
pkgver='0.0009'
pkgrel='1'
pkgdesc="Forces the unavailability of specified Perl modules (for testing)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Devel-Hide'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FERREIRA/Devel-Hide-0.0009.tar.gz')
md5sums=('ca2ed6a23b0a3af29962986761fc1171')
sha512sums=('c1cceb186de73f22132b2b9a16f75389b33b675aaa50c5095615f6f7c22fd0bad9edaf1d66d1cfbec6d536c93583b17a512bcae73310ac6a854e0c98c2ff6a9c')
_distdir="Devel-Hide-0.0009"

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
