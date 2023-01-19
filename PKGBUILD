# Contributor: Bence Csókás <bence98  sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-marc-crosswalk-dublincore'
pkgver='0.02'
pkgrel='1'
pkgdesc="Convert data between MARC and Dublin Core"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dublincore-record>=0' 'perl-marc-record>=0')
makedepends=()
url='https://metacpan.org/release/MARC-Crosswalk-DublinCore'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/MARC-Crosswalk-DublinCore-0.02.tar.gz')
md5sums=('9927560489c7e87aafe57c3a5e7a69ba')
sha512sums=('ac2e05b3e37169c6182327d3975be4d85b1619931c5cb38a622db4b362d63dda45cc30bfb6bc83a0f7ce9a42bacb408ee4ffab6928834914f99344afad1cb78c')
_distdir="MARC-Crosswalk-DublinCore-0.02"

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
