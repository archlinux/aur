# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-text-csv'
pkgver='1.32'
pkgrel='1'
pkgdesc="comma-separated values manipulator (using XS or PurePerl)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Text-CSV'
source=('http://search.mcpan.org/CPAN/authors/id/M/MA/MAKAMAKA/Text-CSV-1.32.tar.gz')
md5sums=('f476205648694a64684be2ab29e44e19')
sha512sums=('c6f510bc14884300795c93c192581960712ce4c9757785a33991adddbffa78a65263b2497755f2a4492537b3484b823d24ca23642f03954b84b0ed815043239c')
_distdir="Text-CSV-1.32"

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
