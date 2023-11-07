# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dancer'
pkgver='1.3521'
pkgrel='1'
pkgdesc="lightweight yet powerful web application framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dump>=0' 'perl-devel-hide>=0' 'perl-http-body>=0' 'perl-http-cookiejar>=0.008' 'perl-http-date>=0' 'perl-http-message>=0' 'perl-http-server-simple-psgi>=0' 'perl-hash-merge-simple>=0' 'perl-json>=2.90' 'perl-mime-types>=0' 'perl-module-runtime>=0' 'perl-plack>=0' 'perl-try-tiny>=0' 'perl-uri>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-longstring>=0' 'perl-test-nowarnings>=0')
url='https://metacpan.org/release/Dancer'
source=('http://search.cpan.org/CPAN/authors/id/Y/YA/YANICK/Dancer-1.3521.tar.gz')
md5sums=('4df0f801ceaee7d4bebd9f2e3af85b39')
sha512sums=('e6f8ddfd3ee5049821843ceda418bcc89cb976bb75ec21eff0879c612106484c035db536340efee2e00adde4f31d5de556d16ae5423924d4ca49129baac68707')
_distdir="Dancer-1.3521"

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
