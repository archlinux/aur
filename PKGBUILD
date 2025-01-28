# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-jwt'
pkgver='0.036'
pkgrel='1'
pkgdesc="JSON Web Token (JWT, JWS, JWE) as defined by RFC7519, RFC7515, RFC7516"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cryptx>=0.067' 'perl-json>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Crypt-JWT'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/Crypt-JWT-$pkgver.tar.gz")
md5sums=('71a7eebc41e5aeaa25a8d0ee89a8fde2')
sha512sums=('5527fd0b1ef98698e0c1985c5ff1342e56e379c01bf18c7e983a424253bb4bdf488ff1ba2a983917386496565c9553d0ae63a155a2e51be2e2ae0affcdada8d2')
_distdir="Crypt-JWT-$pkgver"

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
