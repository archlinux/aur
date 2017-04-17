# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moose'
pkgver='2.2004'
pkgrel='1'
pkgdesc="A postmodern object system for Perl 5"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.011' 'perl-class-load>=0.09' 'perl-class-load-xs>=0.01' 'perl-data-optlist>=0.107' 'perl-devel-globaldestruction' 'perl-devel-overloadinfo>=0.004' 'perl-devel-stacktrace>=1.33' 'perl-dist-checkconflicts>=0.02' 'perl-eval-closure>=0.04' 'perl-mro-compat>=0.05' 'perl-module-runtime>=0.014' 'perl-module-runtime-conflicts>=0.002' 'perl-package-deprecationmanager>=0.11' 'perl-package-stash>=0.32' 'perl-package-stash-xs>=0.24' 'perl-params-util>=1.00' 'perl-scalar-list-utils' 'perl-sub-exporter>=0.980' 'perl-sub-identify' 'perl-sub-name>=0.20' 'perl-try-tiny>=0.17')
makedepends=()
checkdepends=('perl-test-cleannamespaces>=0.13' 'perl-test-fatal>=0.001' 'perl-test-requires>=0.05')
url='https://metacpan.org/release/Moose'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Moose-2.2004.tar.gz')
md5sums=('f1038784cb5427d4e67868eb87ca6fa1')
sha512sums=('30db47b7416347e059b0a43ac4c95c253aac9391a999cb5a484a040b9ce9e33404ae89b34cd28e0cce35506cdfe3a576b91fc941c4dbbe601f4a7d97a01867e9')
_distdir="Moose-2.2004"

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
