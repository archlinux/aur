# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-redis'
pkgver='1.995'
pkgrel='1'
pkgdesc="Perl binding for Redis database"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-timeout>=0.29' 'perl-io-string>=0' 'perl-try-tiny>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-fatal>=0' 'perl-test-sharedfork>=0' 'perl-test-tcp>=1.19')
url='https://metacpan.org/release/Redis'
source=('https://cpan.metacpan.org/authors/id/D/DA/DAMS/Redis-1.995.tar.gz')
md5sums=('8ef5f8d18409c38d940af474159f9a0b')
sha512sums=('2788017f7e89eb2a074d0c8bfa27dce28504a11ae398c4d69612a06d1a96cae9efbc5626871082aff48355373ed4b27dd703983b314e2467be46b79d48346f02')
_distdir="Redis-1.995"

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
