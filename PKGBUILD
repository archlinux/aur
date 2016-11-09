# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-starlink-ast'
pkgver='1.05'
pkgrel='1'
pkgdesc="Interface to the Starlink AST library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-number-delta>=0')
url='https://metacpan.org/release/Starlink-AST'
source=('http://search.cpan.org/CPAN/authors/id/T/TJ/TJENNESS/Starlink-AST-1.05.tar.gz')
md5sums=('5ca28e250d2fa93882a03603547cb6d6')
sha512sums=('9f1353c139cbecad4b468dbac73d27af53784ed0979fcd6dcb57277e1eae0d1f0d32d18dc4cf8d072b86e0534759c979e386ade809f75b0866a6afe953f00b31')
_distdir="Starlink-AST-1.05"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
