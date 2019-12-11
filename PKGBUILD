# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-renderfile'
pkgver='0.12'
pkgrel='1'
pkgdesc="\"render_file\" helper for Mojolicious"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=5.78' 'perl>=5.01')
makedepends=()
url='https://metacpan.org/release/Mojolicious-Plugin-RenderFile'
source=("http://search.cpan.org/CPAN/authors/id/K/KO/KOORCHIK/Mojolicious-Plugin-RenderFile-${pkgver}.tar.gz")
md5sums=('c5487e8eae5162bd193809baf6581052')
sha512sums=('2b5c25feea73dfd1809a4f4400242b5186687cca5d67988be1ff1e6435ead099b1637bad2a4b52ec5a6c37d25cf3d8c6e15399ebab8fdb6d84a6ed2e9f3777b6')
_distdir="Mojolicious-Plugin-RenderFile-${pkgver}"

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
