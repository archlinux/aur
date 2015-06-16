# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-mongodb'
pkgver='0.708.0.0'
pkgrel='1'
pkgdesc="Official MongoDB Driver for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.20' 'perl' 'perl-authen-scram' 'perl-boolean' 'perl-data-dump' 'perl-datetime>=0.78' 'perl-datetime-tiny' 'perl-json' 'perl-moose' 'perl-namespace-clean' 'perl-safe-isa' 'perl-syntax-keyword-junction' 'perl-throwable' 'perl-tie-ixhash' 'perl-try-tiny')
makedepends=()
checkdepends=('perl-test-deep>=0.111' 'perl-test-fatal' 'perl-test-warn')
url='http://search.mcpan.org/dist/MongoDB'
source=('http://search.mcpan.org/CPAN/authors/id/M/MO/MONGODB/MongoDB-v0.708.0.0.tar.gz')
md5sums=('72dfd57225f2d0cabdb2ce668473d0da')
sha512sums=('1bc623d45e885953d51fcefda8efe2e1fa20b507ef3fda77dac40aa3009f7bd0290c75413dc9ef1f026776dbb1c06b77950842bc2d05d310aad694403130be72')
_distdir="MongoDB-v0.708.0.0"

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
