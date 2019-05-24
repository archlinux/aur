# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-throwable-sugarfactory'
pkgver='0.152700'
pkgrel='1'
pkgdesc="build a library of syntax-sugared Throwable-based exceptions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-inspector>=0' 'perl-import-into>=0' 'perl-module-runtime>=0' 'perl-moo>=1.004000' 'perl-package-variant>=1.003002' 'perl-string-camelcase>=0' 'perl-throwable>=0' 'perl-try-tiny>=0' 'perl>=5.006' 'perl-strictures>=2')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-indistdir>=0')
url='https://metacpan.org/release/Throwable-SugarFactory'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MITHALDU/Throwable-SugarFactory-0.152700.tar.gz')
md5sums=('8b19d41ada31bbca4dce246985e26c07')
sha512sums=('2229a6713597f4f161e5c4dea6ce74f2e46861d2a29f7e7aa158852af0c80020b6016b899a89ac0c52c6620a3eb6020f5074c0ad9011b39c6a7d67b5839f56bf')
_distdir="Throwable-SugarFactory-0.152700"

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
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
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
