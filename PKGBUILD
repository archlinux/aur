# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-lexical-persistence'
pkgver='1.023'
pkgrel='1'
pkgdesc="Persistent lexical variable values for arbitrary calls."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-lexalias>=0.05' 'perl-padwalker>=1.96')
makedepends=()
url='http://search.mcpan.org/dist/Lexical-Persistence'
source=('http://search.mcpan.org/CPAN/authors/id/R/RC/RCAPUTO/Lexical-Persistence-1.023.tar.gz')
md5sums=('6df044eaf0cb5c1b7770863e7e4130ca')
sha512sums=('b67e17bde4f6fc6209516ee6ec74aa273367f83b3bb9d9fe2be3ea2e8a574c1b7bbf751f370a54e1e8de4c845f07cb3de4f142f48e3234efdb13ea11176000db')
_distdir="Lexical-Persistence-1.023"

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
