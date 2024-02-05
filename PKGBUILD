# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pod-cpandoc'
pkgver='0.16'
pkgrel='1'
pkgdesc="perldoc that works for modules you don't have installed"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-ssl>=1.56' 'perl-net-ssleay>=1.49' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Pod-Cpandoc'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SARTAK/Pod-Cpandoc-0.16.tar.gz')
md5sums=('275569bd7d7775f3041dc0df9a7a1b6d')
sha512sums=('ac9ffa4f845f213452a69e05f5f39d3cd4cf2db4c97ba2db1e7d1c6e729575b11540715abfa972ee31dad11aa334093820913a62656e2e9bbae77c910bab51bf')
_distdir="Pod-Cpandoc-0.16"

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
