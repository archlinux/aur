# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-selenium-remote-driver'
pkgver='1.49'
pkgrel='1'
pkgdesc="Perl Client for Selenium Remote Driver"
arch=('any')
license=('Apache 2.0')
options=('!emptydirs')
depends=('perl-archive-zip>=0' 'perl-clone>=0' 'perl-file-which>=0' 'perl-http-message>=0' 'perl-io-string>=0' 'perl-json>=0' 'perl-moo>=1.005' 'perl-sub-install>=0' 'perl-test-longstring>=0' 'perl-try-tiny>=0' 'perl-xml-simple>=0' 'perl-libwww>=0' 'perl-namespace-clean>=0' 'perl>=5.010')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-fatal>=0' 'perl-test-lwp-useragent>=0' 'perl-test-mockmodule>=0.13.0')
url='https://metacpan.org/release/Selenium-Remote-Driver'
source=('http://search.cpan.org/CPAN/authors/id/T/TE/TEODESIAN/Selenium-Remote-Driver-1.49.tar.gz')
md5sums=('7878c2ce428046413a9316eec8103eae')
sha512sums=('d6e18de7515b65db367c8d870df79f4682346d4f8550e6c6b3bd45aee2eaf2a9e072b495d26e992a76b93b7619ffe876eb9c4e84646f40241e7fa9033595e48d')
_distdir="Selenium-Remote-Driver-1.49"

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
