# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname=perl-convert-pem
pkgver=0.08
pkgrel=4
pkgdesc="Read/write encrypted ASN.1 PEM files"
_dist="Convert-PEM"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-class-errorhandler' 'perl-convert-asn1>=0.10' 'perl-crypt-des_ede3')
makedepends=('perl-test-exception' 'perl-module-install')
url="http://metacpan.org/release/$_dist"
source=("https://search.cpan.org/CPAN/authors/id/B/BT/BTROTT/$_dist-$pkgver.tar.gz")
sha512sums=('d5e4342b40d01d534ec5f81ab009af185f795267c1bce792d26739ab07078a618093c720230ac2b6cf10c4b5ae1c282c94afa5b9db2eef6fd66e684d2080c273')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1

  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
