# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-starman'
pkgver='0.4017'
pkgrel='1'
pkgdesc="High-performance preforking PSGI/Plack web server"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dump>=0' 'perl-http-date>=0' 'perl-http-message>=0' 'perl-http-parser-xs>=0' 'perl-net-server>=2.007' 'perl-plack>=0.9971' 'perl-libwww>=0' 'perl>=5.14.0' 'perl-http-parser-xs>=0')
makedepends=()
checkdepends=('perl-test-requires>=0' 'perl-test-tcp>=2.00')
url='https://metacpan.org/release/Starman'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/Starman-${pkgver}.tar.gz")
md5sums=('2af84f1d1ffa7be3db109ed5f1e73353')
sha512sums=('04d40d5f4346cd2425516ffd414dc2eca86d241bdc75e9f6cfd3091dab38f3636aebe8e49cc2b8811d06a2332883330f0d85320668ceddd0f9d15d832d609e07')
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

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
