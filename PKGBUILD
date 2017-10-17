# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-convert-basen'
pkgver='0.01'
pkgrel='1'
pkgdesc="Perl/CPAN Module Convert::BaseN: encoding and decoding of base{2,4,8,16,32,64} strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Convert-BaseN'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DANKOGAI/Convert-BaseN-$pkgver.tar.gz")
md5sums=('4744bcb7692d81d3bbe777f96727f4c4')
sha512sums=('e0a69f928772c4868e0cb310e9b4d6a5dac5919cea3cbf68bef46601fe2f1f0ce31d5974ab60d2eb6043888af61912119e3ae630b0428d51c212e1f12a834a0d')
_distdir="Convert-BaseN-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
