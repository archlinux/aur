# Maintainer: Florian Pritz <bluewind@xinu.at>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-file-next'
pkgver=1.16
pkgrel=4
pkgdesc="File-finding iterator"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/File-Next'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/File-Next-$pkgver.tar.gz")
md5sums=('103bc329cd2b64ec270ac53a7dacb378')
sha512sums=('42c812b8927a18e1f01758a2218f37f2079083117763b41adcee1eb4947b36b1379405707304b948fddd4640e2c34070f4dcd0f217fb60b7ba765efe98be8ad3')
_distdir="File-Next-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor"     \
      PERL_MB_OPT="--installdirs vendor" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
