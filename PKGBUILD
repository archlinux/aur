# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-redis'
pkgver='1.982'
pkgrel='1'
pkgdesc="Perl binding for Redis database"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-timeout>=0.29' 'perl-io-string' 'perl-try-tiny' 'perl>=5.008')
makedepends=()
checkdepends=('perl-pod-coverage-trustpod' 'perl-test-cpan-meta' 'perl-test-deep' 'perl-test-fatal' 'perl-test-sharedfork' 'perl-test-tcp>=1.19')
url='https://metacpan.org/release/Redis'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAMS/Redis-1.982.tar.gz')
md5sums=('dedaa148036f71cdde848a258264527d')
sha512sums=('50cffe25ba01a18726e69811586ae208b5fdfdc794836f2ef8bc0fd658c2fb9eca75ba46288f1412b721d84c077e64918c09f8fbac320f8fbcd14b9d3696f52e')
_distdir="Redis-1.982"

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
