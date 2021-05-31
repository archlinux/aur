# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-authentication'
pkgver='1.36'
pkgrel='1'
pkgdesc="A plugin to make authentication a bit easier"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=8.0' 'perl>=5.016')
makedepends=()
url='https://metacpan.org/release/Mojolicious-Plugin-Authentication'
source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJATRIA/Mojolicious-Plugin-Authentication-${pkgver}.tar.gz")
md5sums=('7eda1fadc272de097aa8d58abb9197ad')
sha512sums=('2c355ab8501c5005230888c38706a1507c49ba73f42721b8cd2af1d6e75b23c5c977b54b1374197b0f51b86f16d8cf4b7bdde3402cc37febf0482330d00c7e5c')
_distdir="Mojolicious-Plugin-Authentication-${pkgver}"

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
