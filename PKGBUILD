# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-syntax-keyword-gather'
pkgver='1.003001'
pkgrel='1'
pkgdesc="Implements the Perl 6 'gather/take' control structure in Perl 5"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter-progressive')
makedepends=()
url='http://search.mcpan.org/dist/Syntax-Keyword-Gather'
source=('http://search.mcpan.org/CPAN/authors/id/F/FR/FREW/Syntax-Keyword-Gather-1.003001.tar.gz')
md5sums=('354b18b6fac52f2f845ed4f882478590')
sha512sums=('999da9d04cb966db95e49b7203581d663f8b86289de5088d8843432c43ffc9bac70d6f67e60d40640661c704f645a2bcacfa5695c635f3dccfb4369f45424675')
_distdir="Syntax-Keyword-Gather-1.003001"

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
