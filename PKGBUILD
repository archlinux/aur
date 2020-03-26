# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moose'
pkgver='2.2012'
pkgrel='3'
pkgdesc="A postmodern object system for Perl 5"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.011' 'perl-class-load>=0.09' 'perl-class-load-xs>=0.01' 'perl-data-optlist>=0.107' 'perl-devel-globaldestruction>=0' 'perl-devel-overloadinfo>=0.005' 'perl-devel-stacktrace>=2.03' 'perl-dist-checkconflicts>=0.02' 'perl-eval-closure>=0.04' 'perl-mro-compat>=0.05' 'perl-module-runtime>=0.014' 'perl-module-runtime-conflicts>=0.002' 'perl-package-deprecationmanager>=0.11' 'perl-package-stash>=0.32' 'perl-package-stash-xs>=0.24' 'perl-params-util>=1.00' 'perl-sub-exporter>=0.980' 'perl-sub-identify>=0' 'perl-sub-name>=0.20' 'perl-try-tiny>=0.17' 'perl-module-runtime-conflicts')
makedepends=()
checkdepends=('perl-test-cleannamespaces>=0.13' 'perl-test-fatal>=0.001' 'perl-test-requires>=0.05')
url='https://metacpan.org/release/Moose'
source=('https://cpan.metacpan.org/authors/id/E/ET/ETHER/Moose-2.2012.tar.gz')
md5sums=('4aaf729a9c575aab2c0cbd127cd8edf1')
sha512sums=('195079c32ce0110ae5d76bc1753b9e5c9aa8b3132049912d85600b7d29470b3426e10ccac50a24acbadbb8e00b68c99a98ca975a001b12096b02f2fa1c1264f3')
_distdir="Moose-2.2012"

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
