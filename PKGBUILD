# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-selenium-remote-driver'
pkgver='0.2701'
pkgrel='1'
pkgdesc="Perl Client for Selenium Remote Driver"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip' 'perl-file-which' 'perl-http-message' 'perl-io-string' 'perl-json' 'perl-list-moreutils' 'perl-moo>=1.005' 'perl-sub-install' 'perl-try-tiny' 'perl-xml-simple' 'perl-libwww' 'perl-namespace-clean' 'perl>=5.010')
makedepends=()
checkdepends=('perl-test-fatal' 'perl-test-lwp-useragent' 'perl-test-longstring' 'perl-test-time' 'perl-test-warn')
url='https://metacpan.org/release/Selenium-Remote-Driver'
source=('http://search.cpan.org/CPAN/authors/id/G/GE/GEMPESAW/Selenium-Remote-Driver-0.2701.tar.gz')
md5sums=('5401ecc8b1fc718160624c3c6c8230ce')
sha512sums=('a976ee725af04d8c0f7b41c6f7eb979c93ba63b81282e84bf7de336917cc1abbcc620eef0176f3bee4280262179bf66a2ab7d44d458d3e8b381de128d854c57d')
_distdir="Selenium-Remote-Driver-0.2701"

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
