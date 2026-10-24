# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-starman'
pkgver='0.4019'
pkgrel='1'
pkgdesc="High-performance preforking PSGI/Plack web server"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-data-dump>=0' 'perl-http-date>=0' 'perl-http-message>=0' 'perl-http-parser-xs>=0' 'perl-net-server>=2.007' 'perl-plack>=0.9971' 'perl-libwww>=0' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-requires>=0' 'perl-test-tcp>=2.00')
url='https://metacpan.org/release/Starman'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Starman-$pkgver.tar.gz")
md5sums=('b172f13b7c20b46e1499b07a91b69e4e')
sha512sums=('db1aa765c1f504ea7555cd91af21629b4fa0d9ef1a5964c2d6ef7da2f7b6e241d90ba5ca64876dc645ca13063d99dbc38ee2d840fece85fef489d63ea9686630')
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
