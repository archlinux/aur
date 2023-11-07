# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-module-extractuse'
pkgver='0.345'
pkgrel='1'
pkgdesc="Find out what modules are used"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.28' 'perl-parse-recdescent>=1.967009' 'perl-pod-strip>=0' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-nowarnings>=0')
url='https://metacpan.org/release/Module-ExtractUse'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOMM/Module-ExtractUse-0.345.tar.gz')
md5sums=('5b78f7a628ea979f26172eacc28d7b2b')
sha512sums=('c821a9c3fb0b22d77aef07e3990c457d1979a243533e67eb924d50145baff96d8beefcd6d103fd6ddcb451559cb8002ab60e2889e74703b6ff15434d089f7f9b')
_distdir="Module-ExtractUse-0.345"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
