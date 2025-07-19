# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-hascompiler'
pkgver='0.025'
pkgrel='2'
pkgdesc="Check for the presence of a compiler"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/ExtUtils-HasCompiler'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-HasCompiler-$pkgver.tar.gz")
md5sums=('ad4c2622cad747b52965ecedbee2ceff')
sha512sums=('d5560a22f43cdfb7900aeedf5780c08cec8e0761a5873fafec4018ebf872ae48adac02ad218f13d138d64a33365d34966f099b119ff14b7b6f8239708560c11d')
_distdir="ExtUtils-HasCompiler-$pkgver"

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
