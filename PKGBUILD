# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-pquery'
pkgver='0.15'
pkgrel='1'
pkgdesc="A port of jQuery.js to Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tree')
makedepends=()
url='http://search.mcpan.org/dist/pQuery'
source=('http://search.mcpan.org/CPAN/authors/id/I/IN/INGY/pQuery-0.15.tar.gz')
md5sums=('1276117144dd7aa0de6ba0790cd9aef6')
sha512sums=('277f22cfbc296d0cea6388630e3d223b895465b05fd1c7b143e1cfb7db54479279f216085fddca2a40306774e804751befb5d9d294adb3d755ed74103a1572af')
_distdir="pQuery-0.15"

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
