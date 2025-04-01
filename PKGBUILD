# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-config-auto'
pkgver='0.44'
pkgrel='1'
pkgdesc="Magical config file parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-inifiles>=0' 'perl-io-string>=0' 'perl-yaml>=0.67')
makedepends=()
url='https://metacpan.org/release/Config-Auto'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Config-Auto-0.44.tar.gz')
md5sums=('11bdd333bfb4dcf414fb78ab40a73f7f')
sha512sums=('8102100c6c8fb0f644aecf429c265a3ed502497576cfbcbb011697a0eced072ae8e912eec99dc74796382a394036ade88df7b93d1a2882cd381ae789c71196f9')
_distdir="Config-Auto-0.44"

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
