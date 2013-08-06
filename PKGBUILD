# Maintainer: Florian Pritz <bluewind@xinu.at>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-file-next'
pkgver=1.12
pkgrel=1
pkgdesc="File-finding iterator"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/File-Next'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/File-Next-$pkgver.tar.gz")
md5sums=('725e888d1600fed62cd89b9dac989304')
sha512sums=('eb742ed03f91463946ffe9d2ddade77f794996f4007ba6ae924255cf028d14959a3263c254ef9e7bed1e10ec40a244364743c40b2f34c2160064059b1f4c6f2f')
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
