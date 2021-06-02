# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-jwt'
pkgver='0.025'
pkgrel='2'
pkgdesc="JSON Web Token (JWT, JWS, JWE) as defined by RFC7519, RFC7515, RFC7516"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cryptx>=0.034' 'perl-json-maybexs>=1.003005' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Crypt-JWT'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/Crypt-JWT-$pkgver.tar.gz")
md5sums=('1057f0fed5a2e85305a86bc0ad6b4c1b')
sha512sums=('dea85ea2fd0b340c3a99c8c1f422e1df7993f655371374849f8b92817fa6f4716b00cc44f208936608f7de0755c627df8f082a40da6847829412c5a28a585883')
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
