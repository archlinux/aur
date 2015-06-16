# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-const-fast'
pkgver='0.014'
pkgrel='1'
pkgdesc="Facility for creating read-only scalars, arrays, and hashes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter-progressive>=0.001007' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-fatal')
url='http://search.mcpan.org/dist/Const-Fast'
source=('http://search.mcpan.org/CPAN/authors/id/L/LE/LEONT/Const-Fast-0.014.tar.gz')
md5sums=('e7e73b03102c4ac27053b25362349a82')
sha512sums=('89258205fe31aa5a60759ed955e6dae305de69f4bc08251242a82eec9e37251b045908585c470106ed9047f604d3292eb3231c80504b29734966b58b8402a929')
_distdir="Const-Fast-0.014"

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
