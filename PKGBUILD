# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-object-destroyer'
pkgver='2.01'
pkgrel='1'
pkgdesc="Make objects with circular references DESTROY normally"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='http://search.cpan.org/dist/Object-Destroyer'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Object-Destroyer-2.01.tar.gz')
md5sums=('092ab6314bc5dc366ba2437a9739e194')
sha512sums=('ee507d8e2e7d0661c6e1a0842f95495a36d79087083d7aa870233b854face37914c796bbe009782cf08e98696ea6a4da0f55b7e4007a2463b42f16329e3a26c3')
_distdir="Object-Destroyer-2.01"

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
