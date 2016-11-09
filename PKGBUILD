# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-chemistry-elements'
pkgver='1.07'
pkgrel='1'
pkgdesc="Perl extension for working with Chemical Elements"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Chemistry-Elements'
source=('http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Chemistry-Elements-1.07.tar.gz')
md5sums=('81537ee461db6804f4aace7b4c574c81')
sha512sums=('bfed7ab91c2554f01cb8923ac311dae8986fdbdbde35f6868aa59d3c1b9c10ac047e222b5473204fd4b464e3fc93ac7fb80a907b57ceeb9bea3afb1d7850445f')
_distdir="Chemistry-Elements-1.07"

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
