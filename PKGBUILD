# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-validatesubs'
pkgver='1.012004'
pkgrel='1'
pkgdesc="Validating sub routines via Type::Tiny."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=0' 'perl-moox-returnmodifiers>=0.09' 'perl-type-tiny>=1.002000' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooX-ValidateSubs'
source=('https://cpan.metacpan.org/authors/id/L/LN/LNATION/MooX-ValidateSubs-1.012004.tar.gz')
md5sums=('9b5a0034a6c06f9d00e9169ce8beb7d0')
sha512sums=('d2ea540a7d1561bd08c9c9af1343e14bbbb20234fad1b5da60267a247c164621e2ee9ce65b0690b827367e70258e268882b05acbc18742fd35e08cbadadafdc5')
_distdir="MooX-ValidateSubs-1.012004"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
