# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-jwt'
pkgver='0.037'
pkgrel='2'
pkgdesc="JSON Web Token (JWT, JWS, JWE) as defined by RFC7519, RFC7515, RFC7516"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-cryptx>=0.067' 'perl-json>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Crypt-JWT'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/Crypt-JWT-$pkgver.tar.gz")
md5sums=('4a1feea1f2034e2b4d23fc64766eb16d')
sha512sums=('99e27643bdbd3647382d958660ba1199922acddd72e5e097f53f68c86b6b2d959955f90c6d32c1257ca0e243a9af637646808615fcde483ef9c8ea041c152ffe')
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
