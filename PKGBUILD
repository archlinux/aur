# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-throwable-sugarfactory'
pkgver='0.213360'
pkgrel='1'
pkgdesc="build a library of syntax-sugared Throwable-based exceptions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-inspector>=0' 'perl-import-into>=0' 'perl-module-runtime>=0' 'perl-moo>=1.004000' 'perl-package-variant>=1.003002' 'perl-string-camelcase>=0' 'perl-throwable>=0' 'perl-try-tiny>=0' 'perl>=5.006' 'perl-strictures>=2')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-indistdir>=0')
url='https://metacpan.org/release/Throwable-SugarFactory'
source=("https://cpan.metacpan.org/authors/id/M/MI/MITHALDU/Throwable-SugarFactory-$pkgver.tar.gz")
md5sums=('3f1f7bf411755d731b4144ba9803da49')
sha512sums=('5db2830520172f3f46735bb993d865a1b62228cef0d6af3872ab38b655fa5bf210ad957e4c5cbcffc80139ab04778bc83eaca0d5a795fdb008a504c7602e2309')
_distdir="Throwable-SugarFactory-$pkgver"

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
