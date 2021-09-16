# CPAN Name  : App-Cmd
# Maintainer : camb
# Contributor: camb
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-app-cmd'
pkgver='0.334'
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
md5sums=('2b9e648adae3cf7f122e824a06042197')
sha512sums=('bc45141475cc389afea4220c5197559be0e379ee7c9668e52fae9864c5747f4bd487edf44abc25a21ab5b428689b93ed7607e4fe8a8844faab248623b027288d')
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
