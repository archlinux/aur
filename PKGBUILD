# Contributor: Olivire Mehani <shtrom-arch@ssji.net>
# $Id$
# Generator  : CPANPLUS::Dist::Arch 1.06
pkgname=perl-crypt-x509
pkgver=0.50
pkgrel=2
pkgdesc="Pure Perl X.509 Parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-convert-asn1>=0.19')
url='http://search.cpan.org/dist/Crypt-X509'
source=("http://search.cpan.org/CPAN/authors/id/A/AJ/AJUNG/Crypt-X509-$pkgver.tar.gz")
md5sums=('482794b50c9a522b27ac2a2ce5c814c2')

build() {
  PERL=/usr/bin/perl
  DIST_DIR="${srcdir}/Crypt-X509-$pkgver"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { cd "$DIST_DIR" &&
    $PERL Makefile.PL &&
    make &&
    make test &&
    make install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
