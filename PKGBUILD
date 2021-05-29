# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-coerce-types-standard'
pkgver='0.000007'
pkgrel='1'
pkgdesc="Coercing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=2.003002' 'perl-moox-lazierattributes>=1.03' 'perl-type-tiny>=1.002001' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Coerce-Types-Standard'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Coerce-Types-Standard-$pkgver.tar.gz")
md5sums=('c05940c59987058977e9c6072a89f17c')
sha512sums=('7a42b5761a8a70312602abedf5363ab911d09e38f9cdaf7c7a8360c0016013a2f60120a2e25013cac88064c85703d65b484cd8d9bea40c341f391456a37292d2')
_distdir="Coerce-Types-Standard-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
