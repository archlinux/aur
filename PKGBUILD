# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-redis'
pkgver='2.000'
pkgrel='3'
pkgdesc="Perl binding for Redis database"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-io-socket-timeout>=0.29' 'perl-io-string>=0' 'perl-try-tiny>=0' 'perl>=5.010')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-fatal>=0' 'perl-test-sharedfork>=0' 'perl-test-tcp>=1.19' 'redis')
url='https://metacpan.org/release/Redis'
source=("https://cpan.metacpan.org/authors/id/D/DA/DAMS/Redis-$pkgver.tar.gz")
md5sums=('8b8656bd6077250ffa1156667139ec55')
sha512sums=('9848efc9c9318131e9126e0e59c137b4524e70f3fb5414e05bfd5eb5ad7a516727404287b1ad91339e9cc7256b905e013739bcc9dd0b98b15897a453eddc6a15')
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
