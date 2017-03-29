# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-chemistry-elements'
pkgver='1.071'
pkgrel='1'
pkgdesc="Perl extension for working with Chemical Elements"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Chemistry-Elements'
source=('http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Chemistry-Elements-1.071.tar.gz')
md5sums=('ecb456164a66372a5a15c12ae6a469ee')
sha512sums=('4af09435a43e9c8a8651f7333e10a2a52ea221cbc179332b4deb472f8af59ac1fd1b0551a5af33ce8f58c032dbdaaaba459836da746a80889e9e089d301bb385')
_distdir="Chemistry-Elements-1.071"

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
