# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pdf-fromhtml'
pkgver='0.33'
pkgrel='1'
pkgdesc="Perl/CPAN Module PDF::FromHTML: Convert HTML documents to PDF"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-graphics-colornames' 'perl-html-tidy' 'perl-image-size' 'perl-pdf-api2' 'perl-pdf-writer>=0.05' 'perl-xml-twig' 'perl-libwww' 'perl>=5.6.0')
makedepends=()
checkdepends=()
url='https://metacpan.org/release/PDF-FromHTML'
source=("http://search.cpan.org/CPAN/authors/id/A/AU/AUDREYT/PDF-FromHTML-$pkgver.tar.gz")
md5sums=('25d597f578fe0f1347217d3aefecd364')
sha512sums=('db47c19c061f88bceb9985a78e2487c95a54e75075c787e60fecfbeffaa97dfaf7eb645c646d8d052ca54538a5f259526d4e7bd48b78b9c83ab7ba38c297adab')
_distdir="PDF-FromHTML-$pkgver"

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
