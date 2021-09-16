# CPAN Name  : App-Cmd
# Maintainer : camb
# Contributor: camb
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-app-cmd'
pkgver='0.331'
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
md5sums=('b43c07d7b4d4e2a6baf32aa92cd00b93')
sha512sums=('cb5f4515417affc46e48aa0cfecc37b2856a35081f1e1a4197a1ef020de69a5d0ba19bc54be6c84f239147e8dbfb538e7b8ea760431a2d0f4b369684e4ea42c6')
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
