# Maintainer: Florian Pritz <bluewind@xinu.at>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-file-next'
pkgver=1.10
pkgrel=2
pkgdesc="File-finding iterator"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/File-Next'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/File-Next-$pkgver.tar.gz")
md5sums=('dcaade658846c8100b0a5e43fae8920d')
sha512sums=('f66e5b08b234cef7be3ac1dcf390ae76e8d66499c9a48dcb955254e23fb9e2523a255c56b5e53b505012729faddc19f89439ae7a12ab53e2f7a460659af808c5')
_distdir="${srcdir}/File-Next-$pkgver"

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
