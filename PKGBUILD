# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-jwt'
pkgver='0.038'
pkgrel='1'
pkgdesc="JSON Web Token (JWT, JWS, JWE) as defined by RFC7519, RFC7515, RFC7516"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-cryptx>=0.067' 'perl-json>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Crypt-JWT'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIK/Crypt-JWT-$pkgver.tar.gz")
md5sums=('6be80e1f128c8b85c67b69b75b32a451')
sha512sums=('55f194f21759247f20b903defff347d5dff9fe2dc7b6559d0e4707ee8caaf945d8c04f555b314b5c5cc5ce3f93a85fb8b12b8f8be359295a6f65afad669eea66')
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
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
