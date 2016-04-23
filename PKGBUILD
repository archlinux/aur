# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-fake-httpd'
pkgver='0.07'
pkgrel='1'
pkgdesc="a fake HTTP server"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-daemon' 'perl-plack' 'perl-test-sharedfork>=0.29' 'perl-test-tcp' 'perl-uri' 'perl>=5.8.1')
makedepends=('perl-test-exception' 'perl-test-useallmodules' 'perl-libwww')
url='https://metacpan.org/release/Test-Fake-HTTPD'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MASAKI/Test-Fake-HTTPD-0.07.tar.gz')
md5sums=('652c5723b6ad11df65f5eab0440810ab')
sha512sums=('06d147ed9d645dd74007fb6addbe6eb2de94dbeb87189f18e059698ba0a8671f36503df229df14deeac81307da6ebedbb0e2154c43129c9b5a68db2a7dfe16c6')
_distdir="Test-Fake-HTTPD-0.07"

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
