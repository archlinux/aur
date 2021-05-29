# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-redis'
pkgver='1.998'
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
md5sums=('187d464968fdca58eec675856a8cd0fe')
sha512sums=('232f0e602f6165da426ff6ee6a531f81eea3491c0312dae2813bdb15ac34469f6621c7683d5bd6b2be0cdcc09edf3f1f19cc03c848d43d41e630fe1306f62268')
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
