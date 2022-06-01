# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-perlio-layers'
pkgver='0.012'
pkgrel='2'
pkgdesc="Querying your filehandle's capabilities"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.4231' 'perl>=5.008_001')
makedepends=()
url='https://metacpan.org/release/PerlIO-Layers'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/PerlIO-Layers-${pkgver}.tar.gz")
md5sums=('543865060a356cb574b6086067e23cd0')
smd5sums=('543865060a356cb574b6086067e23cd0')
sha512sums=('3b8c0103faa49227b68cc6bb835e34c7b3f9731f83421a9b58ad68e469c55795ab977e6983ece8fe6db5b9f0ff4d615affbbea00716cd87a1af28571707dcf6e')
ha512sums=('3b8c0103faa49227b68cc6bb835e34c7b3f9731f83421a9b58ad68e469c55795ab977e6983ece8fe6db5b9f0ff4d615affbbea00716cd87a1af28571707dcf6e')
_distdir="PerlIO-Layers-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
