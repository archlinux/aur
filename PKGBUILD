# CPAN Name  : App-Cmd
# Maintainer : camb
# Contributor: camb
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-app-cmd'
pkgver='0.336'
pkgrel='1'
pkgdesc="write command line apps with less suffering"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny>=0.13' 'perl-class-load>=0.06' 'perl-data-optlist>=0' 'perl-getopt-long-descriptive>=0.084' 'perl-io-tiecombine>=0' 'perl-module-pluggable>=0' 'perl-string-rewriteprefix>=0' 'perl-sub-exporter>=0' 'perl-sub-install>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/App-Cmd'
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/App-Cmd-$pkgver.tar.gz")
md5sums=('0f6de016a007ee84101925f47bf91570')
sha512sums=('1d700a2a79b08b32d986cb56f145ee3014a0f827ca77370cf4569d839c6c914b865781caa0cf38cb162f1a5db5a7c4d729e7672ff73f6f6d0d2bc52e4249ca39')
_distdir="App-Cmd-$pkgver"

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
