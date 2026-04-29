# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-starman'
pkgver='0.4018'
pkgrel='1'
pkgdesc="High-performance preforking PSGI/Plack web server"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-data-dump>=0' 'perl-http-date>=0' 'perl-http-message>=0' 'perl-http-parser-xs>=0' 'perl-net-server>=2.007' 'perl-plack>=0.9971' 'perl-libwww>=0' 'perl>=5.8.1')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-requires>=0' 'perl-test-tcp>=2.00')
url='https://metacpan.org/release/Starman'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Starman-$pkgver.tar.gz")
md5sums=('15a65eefb14b2e8f89bb7f8e155ae5ed')
sha512sums=('b839ea13b94ec9556145956a7d3f6973ed99579d30a6102c325e9eac6b306aa6f64f5ac000159a01142fa380a149f5c2be890c6fc3f8846f9922993c489c81fe')
_distdir="Starman-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
   /usr/bin/perl Build.PL
   /usr/bin/perl Build
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  /usr/bin/perl Build test
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
