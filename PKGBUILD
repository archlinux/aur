# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-selenium-remote-driver'
pkgver='1.50'
pkgrel='1'
pkgdesc="Perl Client for Selenium Remote Driver"
arch=('any')
license=('Apache 2.0')
options=('!emptydirs')
depends=('perl-archive-zip>=0' 'perl-clone>=0' 'perl-file-which>=0' 'perl-http-message>=0' 'perl-io-string>=0' 'perl-json>=0' 'perl-moo>=1.005' 'perl-sub-install>=0' 'perl-try-tiny>=0' 'perl-xml-simple>=0' 'perl-libwww>=0' 'perl-namespace-clean>=0' 'perl>=5.010')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-fatal>=0' 'perl-test-lwp-useragent>=0' 'perl-test-longstring>=0' 'perl-test-mockmodule>=0.13.0')
url='https://metacpan.org/release/Selenium-Remote-Driver'
source=('http://search.cpan.org/CPAN/authors/id/T/TE/TEODESIAN/Selenium-Remote-Driver-1.50.tar.gz')
md5sums=('55fb02995bb4c1f6f5c57df959f85d76')
sha512sums=('6cd8f8cbb0a74204d6112f4d86b720b349ef1e4e3d230d3a9d0c89ba2843c6e8ccd414c940bc10647eb998f1a5806f4aa3aeba829e8c079238d7afd58ef15df6')
_distdir="Selenium-Remote-Driver-1.50"

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
