# CPAN Name  : App-Cmd
# Maintainer : camb
# Contributor: camb
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-app-cmd'
pkgver='0.337'
pkgrel='1'
pkgdesc="write command line apps with less suffering"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny>=0.13' 'perl-class-load>=0.06' 'perl-data-optlist>=0' 'perl-getopt-long-descriptive>=0.116' 'perl-io-tiecombine>=0' 'perl-module-pluggable>=0' 'perl-string-rewriteprefix>=0' 'perl-sub-exporter>=0' 'perl-sub-install>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/App-Cmd'
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/App-Cmd-$pkgver.tar.gz")
md5sums=('a9944e8d2f4c57c4c8ee1eaa9507065c')
sha512sums=('e06171aca8a3d318927e0ecbba97e6376c1ecd1c756686fc1a882305f4fd74f251ae8c585596ee12c3adf76160059184c4f765da4b9389b3f092dd3088a178b2')
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
