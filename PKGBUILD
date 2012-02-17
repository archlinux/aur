# Maintainer: Florian Pritz <bluewind@xinu.at>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-file-next'
pkgver='1.06'
pkgrel=2
pkgdesc="File-finding iterator"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/File-Next'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/File-Next-1.06.tar.gz')
md5sums=('8d901b18e40c477acd18a6ea0fd7de64')
sha512sums=('f21a17f496bc83da556d9f012746891be7f83168854694abf18056c45f3de8d62635064faf894665780511ac5f3e8116c8a5a9a947eb82e2cb1088f195854a51')
_distdir="${srcdir}/File-Next-1.06"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
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
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
