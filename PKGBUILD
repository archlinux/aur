# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-size'
pkgver='0.84'
pkgrel='1'
pkgdesc="Perl extension for finding the memory usage of Perl variables"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.005')
makedepends=()
url='https://metacpan.org/release/Devel-Size'
source=("http://search.cpan.org/CPAN/authors/id/N/NW/NWCLARK/Devel-Size-$pkgver.tar.gz")
md5sums=('4978c07f54a730b16a705e074d7685e3')
sha512sums=('91dea46352114da3dd2e4f4440b8bb9372c52607f5975370cafb89f5fe9b6c3979a087b5303546f2e59f7abbe67fe6979caf0ac6379c9efd97c3c1a8cf5da160')
_distdir="Devel-Size-$pkgver"

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
