# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-devel-animator'
pkgver='2.20'
pkgrel='1'
pkgdesc="trace based source code animator"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-tk' 'perl-tk-statusbar')
makedepends=()
url='http://search.mcpan.org/dist/Devel-Animator'
source=('http://search.mcpan.org/CPAN/authors/id/A/AS/ASAAG/Devel-Animator-2.20.tar.gz')
md5sums=('56849f00b0d817325de4af22c94ea5f7')
sha512sums=('e0917d658146bee915ed38ffb7262b4c2dd1d2605da599336fce03a92634985e55d45a417a928b8e0a1dc8fcaf13cbbbfa9861df6b733e2306affa1a1ea10e31')
_distdir="Devel-Animator-2.20"

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
