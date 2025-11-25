# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-plack-test-agent'
pkgver='1.6'
pkgrel='1'
pkgdesc="OO interface for testing low-level Plack/PSGI apps"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-http-cookies>=0' 'perl-http-message>=0' 'perl-http-server-simple-psgi>=0' 'perl-modern-perl>=0' 'perl-plack>=0' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-memory-cycle>=0' 'perl-test-requires>=0' 'perl-test-tcp>=0' 'perl-test-www-mechanize>=0')
url='https://metacpan.org/release/Plack-Test-Agent'
source=("http://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/Plack-Test-Agent-$pkgver.tar.gz")
md5sums=('f67a7551f758affa7738d42aafc27a00')
sha512sums=('1372ab15d91f861f94dd99d07058b25aea482974c6918dc8a9d42587db7c5193502cc3884733824ff7f0870deedbcbb62d1ed2ce20a18c1b2375d1f1140d5c93')
_distdir="Plack-Test-Agent-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
