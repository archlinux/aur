# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-data-dpath'
pkgver='0.50'
pkgrel='1'
pkgdesc="DPath is not XPath!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-xsaccessor' 'perl-iterator-util' 'perl-list-moreutils' 'perl-sub-exporter' 'perl-aliased')
makedepends=()
checkdepends=('perl-test-deep')
url='http://search.mcpan.org/dist/Data-DPath'
source=('http://search.mcpan.org/CPAN/authors/id/S/SC/SCHWIGON/Data-DPath-0.50.tar.gz')
md5sums=('e3fdba9f6d88988b7e85c0d558acb0e3')
sha512sums=('34b956296f1495cc496c56863b7a381ac539c1304a9da48d67b161596d9bf1d43b027a510ce845b0f55dc2c72945bac35cf57acc58d83ee7d671da37cc2b774b')
_distdir="Data-DPath-0.50"

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
