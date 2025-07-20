# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-traceuse'
pkgver='2.097'
pkgrel='2'
pkgdesc="show the modules your program loads, recursively"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Devel-TraceUse'
source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOOK/Devel-TraceUse-$pkgver.tar.gz")
md5sums=('54e060eefd942e9c586f8774b1d03ae7')
sha512sums=('75111b4c6f55475c473d9abe4d7d15e3a9f5913807934a10d0f393238d8895db30113187240c179cddb0cbb19c0daffac8e3f7acb073e060dc583b795d716e9b')
_distdir="Devel-TraceUse-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
