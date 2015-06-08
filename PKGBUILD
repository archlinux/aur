# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-set-tiny'
pkgver='0.01'
pkgrel='1'
pkgdesc="Simple sets of strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Set-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/T/TR/TRENDELS/Set-Tiny-0.01.tar.gz')
md5sums=('1edda94a178ac2911f6f2a2e1101b633')
sha512sums=('c5ecad403073ab980a71577d7957110f378838eaffc156d45b9400539523ede48cf200e62ff057a485c759f8cdc0521dcf8d07093272a766a1eb501b6f78d3f0')
_distdir="Set-Tiny-0.01"

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
