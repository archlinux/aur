# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-uri-imaps'
pkgver='1.02'
pkgrel='1'
pkgdesc="Support IMAPS URI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri')
makedepends=()
url='http://search.cpan.org/dist/URI-imaps'
source=('http://search.cpan.org/CPAN/authors/id/A/AL/ALEXM/URI-imaps-1.02.tar.gz')
md5sums=('1cc8824b41f244ae59b25a0bc25172ad')
sha512sums=('2b06679c798fbb41717fefa2ec4e2eec8fdff514f1f4b8fdbc53a74a6f3b73bfd03a7d1cbc80c213cf01c06222e5972170b8862234b1215cd63a03cb7cc02bc8')
_distdir="URI-imaps-1.02"

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
