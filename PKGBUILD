# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-lingua-ru-number'
pkgver='0.61'
pkgrel='1'
pkgdesc="Converts numbers to money sum in words (in Russian roubles)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Lingua-RU-Number'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SAFRONOV/Lingua-RU-Number-0.61.tar.gz')
md5sums=('930e4ec20b69180873b348760afc928c')
sha512sums=('8fbd4c423f890b8f259cee0b4eb1a49ad82774cd8146b40b494bb967ad7a3002ea6a54c81fca0d127414bb85b24bc33189d4735e743caa9d28e519197ada1fa3')
_distdir="Lingua-RU-Number-0.61"

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
