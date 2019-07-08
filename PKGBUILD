# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-starman'
pkgver='0.4015'
pkgrel='1'
pkgdesc="High-performance preforking PSGI/Plack web server"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dump>=0' 'perl-http-date>=0' 'perl-http-message>=0' 'perl-http-parser-xs>=0' 'perl-net-server>=2.007' 'perl-plack>=0.9971' 'perl-libwww>=0' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-requires>=0' 'perl-test-tcp>=2.00')
url='https://metacpan.org/release/Starman'
source=('https://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/Starman-0.4015.tar.gz')
md5sums=('6318bf834964fe99a12a83fb6923b8d7')
sha512sums=('8e603dfc27ee54b577c24bd521da08ecb56ae2b6992ad2304156a23b917465b3a14d11e1f038ca809ff6359798e03d3ce6d6aa705e55637401d8391ec5086ade')
_distdir="Starman-0.4015"

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
