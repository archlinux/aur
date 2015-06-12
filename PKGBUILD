# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.09
pkgname='perl-crypt-rijndael'
pkgver='1.12'
pkgrel='2'
pkgdesc="AES/Rijndael Encryption Module"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-manifest>=1.14')
url='http://search.cpan.org/dist/Crypt-Rijndael'
source=("http://cpan.metacpan.org/authors/id/B/BD/BDFOY/Crypt-Rijndael-${pkgver}.tar.gz")
md5sums=('5e50f9b5d8ca20ee615af1228a26d955')

build() {
  PERL=/usr/bin/perl
  DIST_DIR="${srcdir}/Crypt-Rijndael-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { cd "$DIST_DIR" &&
    $PERL Makefile.PL &&
    make &&
    make test
}
}

package() {
  DIST_DIR="${srcdir}/Crypt-Rijndael-${pkgver}"
  { cd "$DIST_DIR" &&
    make install;
  };

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
