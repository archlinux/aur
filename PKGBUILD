# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-aligner'
pkgver='0.07'
pkgrel='1'
pkgdesc="Align text in columns"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Text-Aligner'
source=('http://search.cpan.org/CPAN/authors/id/A/AN/ANNO/Text-Aligner-0.07.tar.gz')
md5sums=('73088eaeae1e6c627398db1e7cc76717')
sha512sums=('f3c161e88b12cd999b55529af8002702d324923fecf986b84bac610c5cfade6e1bf4d34285c00927ace232a9bbff11f2748913d0e6e87f5d27c2d381e64403ac')
_distdir="Text-Aligner-0.07"

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
