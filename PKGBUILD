# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-io-capture'
pkgver='0.05'
pkgrel='1'
pkgdesc="Abstract Base Class to build modules to capture output."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/IO-Capture'
source=('http://search.cpan.org/CPAN/authors/id/R/RE/REYNOLDS/IO-Capture-0.05.tar.gz')
md5sums=('4760036d7fcf9f2cc34f2b2eefd511a4')
sha512sums=('7e2176a34cd1fc6d95f27160196c73e88d44cc96d7f2ed002d1bad242ed4edd00e24943f1d712bd014d3a2b6f2e9f26054cf270e0265edd6ca5829ba3ce14923')
_distdir="IO-Capture-0.05"

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
