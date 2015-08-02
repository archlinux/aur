# Contributor: gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-term-size-perl'
pkgver='0.029'
pkgrel='1'
pkgdesc="Perl extension for retrieving terminal size (Perl version)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Term-Size-Perl'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FERREIRA/Term-Size-Perl-0.029.tar.gz')
md5sums=('e647aed35b0c4973e949c311a8222dbf')
sha512sums=('0f1b3ad458adb46d1107b053e078d55d2e3ecf6d582b685e75ef792073d807ac79d71f91160a83c8d4fc53b01275656c571df61008f58252fb743f9220ec16a5')
_distdir="Term-Size-Perl-0.029"

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
