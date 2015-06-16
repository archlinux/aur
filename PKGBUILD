# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-redis'
pkgver='1.978'
pkgrel='1'
pkgdesc="Perl binding for Redis database"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-timeout>=0.22' 'perl-io-string' 'perl-try-tiny')
makedepends=()
checkdepends=('perl-pod-coverage-trustpod' 'perl-test-cpan-meta' 'perl-test-deep' 'perl-test-fatal' 'perl-test-sharedfork' 'perl-test-tcp>=1.19')
url='https://metacpan.org/release/Redis'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAMS/Redis-1.978.tar.gz')
md5sums=('e75fb67eb8cc29feb8cf28a35028bbf8')
sha512sums=('64cc343a30bf7ebf3bd84bd32ec91c2e1371cf3b8ce119fe16d6a44f586d99bda726f5ef1a15c5a534eaf32c43825a9f84e18a0f6f04b8890f54406416121e91')
_distdir="Redis-1.978"

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
