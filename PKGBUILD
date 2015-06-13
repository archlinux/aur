# Contributor: AUR Perl <aurperl@juster.info>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-class-c3-componentised'
pkgver='1.001000'
pkgrel="3"
pkgdesc='Load mix-ins or components to your C3-based class'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-class-c3' 'perl-class-inspector' 'perl-mro-compat')
makedepends=('perl-test-exception' 'perl-test-pod-coverage')
url='http://search.cpan.org/dist/Class-C3-Componentised'
source=('http://search.cpan.org/CPAN/authors/id/F/FR/FREW/Class-C3-Componentised-1.001000.tar.gz')
md5sums=('5ab792bbcf6fc72468c06bf9faa3427d')
sha512sums=('860b7cd09b1add6f252fddc0934e9f542231be90a57cf36afcab55684aca2fdb667777248c3583ad955ce0b76db44297515f56194ed2ec444dd8c801a01b5713')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Class-C3-Componentised-${pkgver}"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/Class-C3-Componentised-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "${srcdir}/Class-C3-Componentised-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
