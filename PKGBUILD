# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-kiokudb'
pkgver='0.57'
pkgrel='1'
pkgdesc="Object Graph storage engine"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cache-ref>=0.02' 'perl-class-load' 'perl-data-stream-bulk>=0.08' 'perl-data-swap' 'perl-data-uuid>=1.203' 'perl-data-visitor>=0.24' 'perl-hash-util-fieldhash-compat' 'perl-json>=2.12' 'perl-json-xs>=2.231' 'perl-module-pluggable' 'perl-moose>=2.0000' 'perl-moosex-clone>=0.04' 'perl-moosex-role-parameterized>=0.10' 'perl-moosex-yaml>=0.04' 'perl-padwalker>=1.9' 'perl-path-class' 'perl-scope-guard' 'perl-search-gin' 'perl-set-object>=1.26' 'perl-sub-exporter' 'perl-throwable' 'perl-tie-toobject' 'perl-try-tiny' 'perl-yaml-libyaml' 'perl-namespace-clean>=0.08')
makedepends=()
checkdepends=('perl-moose' 'perl-test-exception')
url='https://metacpan.org/release/KiokuDB'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/KiokuDB-0.57.tar.gz')
md5sums=('2200535501c6778ebe80073291356e8a')
sha512sums=('4fa70fc1b964aef244d2d086ef797f80881e0a695935a180d4608979d0edba27f730c63aea5bd88864da8ebd6d96337bdaf4e041390147a4b5f4f30bdc4c4636')
_distdir="KiokuDB-0.57"

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
# Tests are broken for 5.22+
# See http://matrix.cpantesters.org/?dist=KiokuDB+0.57
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
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
