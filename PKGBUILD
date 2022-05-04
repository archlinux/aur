# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-redis'
pkgver='1.999'
pkgrel='1'
pkgdesc="Perl binding for Redis database"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-timeout>=0.29' 'perl-io-string>=0' 'perl-try-tiny>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-fatal>=0' 'perl-test-sharedfork>=0' 'perl-test-tcp>=1.19')
url='https://metacpan.org/release/Redis'
source=("https://cpan.metacpan.org/authors/id/D/DA/DAMS/Redis-$pkgver.tar.gz")
md5sums=('38679ee217052b8dfaf76ccc1b69fb01')
sha512sums=('d57b3e14b906cb765e2677854899dfdc451b29a74cb44be3336269c452378b5bc36d7f07bafd86ef6f756958abc75e3449c9f35cfadf011b4fa406609be0ea59')
_distdir="Redis-$pkgver"

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
