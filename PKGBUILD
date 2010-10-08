# Contributor: Olivire Mehani <shtrom-arch@ssji.net>
# $Id$
# Generator  : CPANPLUS::Dist::Arch 1.06
pkgname='perl-crypt-x509'
pkgver='0.40'
pkgrel='1'
pkgdesc="Pure Perl X.509 Parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-convert-asn1>=0.19')
url='http://search.cpan.org/dist/Crypt-X509'
source=('http://search.cpan.org/CPAN/authors/id/A/AJ/AJUNG/Crypt-X509-0.40.tar.gz')
md5sums=('29461a6241c9b763393dd3f45c0919d1')

build() {
  PERL=/usr/bin/perl
  DIST_DIR="${srcdir}/Crypt-X509-0.40"
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
