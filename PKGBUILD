# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-css-dom'
pkgver='0.16'
pkgrel='1'
pkgdesc="Document Object Model for Cascading Style Sheets"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone>=0.09')
makedepends=()
url='https://metacpan.org/release/CSS-DOM'
source=('http://search.cpan.org/CPAN/authors/id/S/SP/SPROUT/CSS-DOM-0.16.tar.gz')
md5sums=('31850d4a426bef34b8b451797c770678')
sha512sums=('217564d3d731362a9890227491a8b2d2351410afe6e33d6ddc13b927a7b6918d11ae1938d906ddb6507f87098bf92655a9af2a1eb484aa90451cdb5dfbbdd88a')
_distdir="CSS-DOM-0.16"

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
