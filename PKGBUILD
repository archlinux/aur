# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-email-valid'
pkgver='1.204'
pkgrel='1'
pkgdesc="Check validity of Internet email addresses"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny>=0' 'perl-mailtools>=0' 'perl-net-dns>=0' 'perl-net-domain-tld>=1.65' 'perl>=5.012')
makedepends=()
url='https://metacpan.org/release/Email-Valid'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Valid-1.204.tar.gz')
md5sums=('fbcfb4e7e4352b625d8d77aa052b3cdf')
sha512sums=('cce10f17fc69400698cbf3dea8368c73f5c6d1435a400fd27670cfab1bc042202b00541f6e2f1c8c81375634efd4065368cd4554e5a5c9f022e94e4b3f976ed1')
_distdir="Email-Valid-1.204"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
