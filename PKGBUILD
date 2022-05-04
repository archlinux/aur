# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-jwt'
pkgver='0.034'
pkgrel='1'
pkgdesc="JSON Web Token (JWT, JWS, JWE) as defined by RFC7519, RFC7515, RFC7516"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cryptx>=0.034' 'perl-json-maybexs>=1.003005' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Crypt-JWT'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/Crypt-JWT-$pkgver.tar.gz")
md5sums=('c5f6b30220356ee5147b7668d8bd442f')
sha512sums=('0fc2012aeb5721d9b5992faf827da5e681353db3eff5fe26367001f5c583af61b2ec277b360938f3659890b0754d86d4248b8507a6538bc5794457efcfa77a09')
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
