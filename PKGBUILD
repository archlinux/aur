# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-jwt'
pkgver='0.024'
pkgrel='1'
pkgdesc="JSON Web Token (JWT, JWS, JWE) as defined by RFC7519, RFC7515, RFC7516"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cryptx>=0.034' 'perl-json-maybexs>=1.003005' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Crypt-JWT'
source=('https://cpan.metacpan.org/authors/id/M/MI/MIK/Crypt-JWT-0.024.tar.gz')
md5sums=('ca6d05a560a8100a1b3efb4f8684055d')
sha512sums=('7900b14a7ee5c9234130a048bb47d7ccee235210efd39090406a46fd0948f92a833c3641caa75422779e4d68d696d4d90fac365795cf06a87b10e326dd7bbcbe')
_distdir="Crypt-JWT-0.024"

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
