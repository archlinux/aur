# Maintainer: Christoph Vigano <mail at cvigano dot de>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-cgi-formbuilder'
pkgver='3.10'
pkgrel='1'
pkgdesc="An extremely fast, reliable form generation and processing module"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=()
makedepends=()
checkdepends=('perl-cgi')
url='https://metacpan.org/release/CGI-FormBuilder'
source=('https://cpan.metacpan.org/authors/id/B/BI/BIGPRESH/CGI-FormBuilder-3.10.tar.gz')
md5sums=('d1fa1ebbfe852a31f0179899ed0c6bcc')
sha512sums=('38d8e6eb729e188074d872b979ad46133152877bb30b95329a2c7275154646a4afb62dc3539cb34781149f424b1d384d05230efe8b174967742625a81765bad5')
_distdir="CGI-FormBuilder-3.09"

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
