# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moose'
pkgver='2.1603'
pkgrel='1'
pkgdesc="A postmodern object system for Perl 5"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.007' 'perl-class-load>=0.09' 'perl-class-load-xs>=0.01' 'perl-data-optlist>=0.107' 'perl-devel-globaldestruction' 'perl-devel-overloadinfo>=0.004' 'perl-devel-stacktrace>=1.33' 'perl-dist-checkconflicts>=0.02' 'perl-eval-closure>=0.04' 'perl-list-moreutils>=0.28' 'perl-mro-compat>=0.05' 'perl-module-runtime>=0.014' 'perl-module-runtime-conflicts>=0.002' 'perl-package-deprecationmanager>=0.11' 'perl-package-stash>=0.32' 'perl-package-stash-xs>=0.24' 'perl-params-util>=1.00' 'perl-sub-exporter>=0.980' 'perl-sub-identify' 'perl-sub-name>=0.05' 'perl-task-weaken' 'perl-try-tiny>=0.17')
makedepends=()
checkdepends=('perl-test-cleannamespaces>=0.13' 'perl-test-fatal>=0.001' 'perl-test-requires>=0.05' 'perl-test-warnings>=0.016')
url='https://metacpan.org/release/Moose'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Moose-2.1603.tar.gz')
md5sums=('fb58efdf8cb287bc925763da6e4443bc')
sha512sums=('130efdb12bdf3ea3a03cf7188637faa9aa3a85de5e36ec5818c3e0f0a7b8a9c4b0959b6102b06bc0b6cc53027ae00f7dfb2e0d4063363b52e55fa4e5b850dae4')
_distdir="Moose-2.1603"

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
