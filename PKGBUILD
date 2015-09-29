# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-redis'
pkgver='1.981'
pkgrel='1'
pkgdesc="Perl binding for Redis database"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-timeout>=0.29' 'perl-io-string' 'perl-try-tiny' 'perl>=5.010')
makedepends=()
checkdepends=('perl-pod-coverage-trustpod' 'perl-test-cpan-meta' 'perl-test-deep' 'perl-test-fatal' 'perl-test-sharedfork' 'perl-test-tcp>=1.19')
url='https://metacpan.org/release/Redis'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAMS/Redis-1.981.tar.gz')
md5sums=('4beb98cac6623524add07814431b851e')
sha512sums=('306c930477f4a88d617545055aa98b0ab2e3101ca822fa58059134822d2e64a4cd330df9da8aabc19bbe2c24fe52cf44854078ee9ad85baba3320a9e97e6bd36')
_distdir="Redis-1.981"

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
