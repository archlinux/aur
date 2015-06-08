# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-ex-override'
pkgver='1.1'
pkgrel='1'
pkgdesc="perl pragma to override core functions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/ex-override'
source=('http://search.cpan.org/CPAN/authors/id/C/CW/CWEST/ex-override-1.1.tar.gz')
md5sums=('1247bd4ec9dae4cb2f250fd5af990668')
sha512sums=('33b864d70e632d6baa573912738233cfba1d094b044d0fd34df5c31f74c3ac162d3faa12f8187538153b25fa502193cd0aa7478024bf3a40af5c0c7822849dfa')
_distdir="ex-override-1.1"

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
