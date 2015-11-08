# CPAN Name  : App-Cmd
# Contributor: camb
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-app-cmd'
pkgver='0.330'
pkgrel='1'
pkgdesc="write command line apps with less suffering"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny>=0.13' 'perl-class-load>=0.06' 'perl-data-optlist>=0' 'perl-getopt-long-descriptive>=0.084' 'perl-io-tiecombine>=0' 'perl-module-pluggable>=0' 'perl-string-rewriteprefix>=0' 'perl-sub-exporter>=0' 'perl-sub-install>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/App-Cmd'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/App-Cmd-0.330.tar.gz')
md5sums=('dde7b65165abeb4613643007583cb03f')
sha512sums=('72d4e011f786cdf3362fbd2f2f1fb46f5978abfad808c4112e98cd65fd548cab48cb2db70c4cccaed7ac535da9d1bf5b15529b7a1002d9fc85fe5d519e42d3ad')
_distdir="App-Cmd-0.330"

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
