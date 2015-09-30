# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-exporter-lite'
pkgver='0.06'
pkgrel='1'
pkgdesc="lightweight exporting of functions and variables"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Exporter-Lite'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Exporter-Lite-0.06.tar.gz')
md5sums=('309d37c45180b3c7716caf3d2ebe1617')
sha512sums=('97f2127d2dad590522c8e38b05b5cdf43026fe91c0df4030a6d129392c4aea63170f9b1dc17740325cd05e797ed8d897d1663f429c880155dc74fa0c58ca81b3')
_distdir="Exporter-Lite-0.06"

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
