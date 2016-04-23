# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-selenium-server'
pkgver='0.02'
pkgrel='1'
pkgdesc="A wrapper of selenium-server-standalone.jar"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-slurp' 'perl-test-tcp' 'perl-libwww' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-useallmodules')
url='https://metacpan.org/release/Selenium-Server'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MASAKI/Selenium-Server-0.02.tar.gz')
md5sums=('04e94ea93bfe949b12495f074ea05d4b')
sha512sums=('2ace6ca78159e35073293f63c6ec3399f12e40e43627be93c339e04e073b2b2253a628724e33103cb1660929561430e476c27478b59a7cb760ae84fc9c701216')
_distdir="Selenium-Server-0.02"

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
