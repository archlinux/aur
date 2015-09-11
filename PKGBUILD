# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-app-cmd'
pkgver='0.327'
pkgrel='1'
pkgdesc="write command line apps with less suffering"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny>=0.13' 'perl-class-load>=0.06' 'perl-data-optlist>=0' 'perl-getopt-long-descriptive>=0.084' 'perl-io-tiecombine>=0' 'perl-module-pluggable>=0' 'perl-string-rewriteprefix>=0' 'perl-sub-exporter>=0' 'perl-sub-install>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='http://search.cpan.org/dist/App-Cmd'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/App-Cmd-0.327.tar.gz')
md5sums=('9f68d78db859888d569188f6f3db065d')
sha512sums=('8aba847824aaf5c4f03981c7c1d773cddab6dfd13a0af8baa2c16f2fd00da0961fd2957aa4011e92ff5d04dd94f1b00be1f2acd51886d3d3b9ec26b1d7b03e8d')
_distdir="App-Cmd-0.327"

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
